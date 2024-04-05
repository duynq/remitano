# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :init_movie, only: :create

    def index
      render json: { meta: pagination, movies: ActiveModelSerializers::SerializableResource.new(resources, each_serializer: MovieSerializer, include: include_option) }
    end

    def create
      @movie.save!
      NotifyNewMovieJob.perform_later(current_user, @movie)
      render json: @movie, serializer: MovieSerializer, status: :created
    end

    private

    def resources_scope
      Movie.all.order(id: :desc)
    end

    def include_option
      {
        user: []
      }
    end

    def init_movie
      @movie = current_user.movies.build(movie_params)
    end

    def movie_params
      params.require(:movie).permit(:url)
    end
  end
end
