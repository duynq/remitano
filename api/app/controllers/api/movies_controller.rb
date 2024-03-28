# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :init_movie, only: :create

    def index
      render json: Movie.all, status: :ok
    end

    def create
      @movie.save!
      render json: @movie, serializer: MovieSerializer, status: :created
    end

    private

    def init_movie
      @movie = current_user.movies.build(movie_params)
    end

    def movie_params
      params.require(:movie).permit(:url)
    end
  end
end
