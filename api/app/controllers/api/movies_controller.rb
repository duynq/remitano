# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    def index
      render json: Movie.all, status: :ok
    end
  end
end
