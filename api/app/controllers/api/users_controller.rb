# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :init_user, only: :create

    def create
      @user.save!
      render json: @user, serializer: UserSerializer, include: include_option, status: :created
    end

    private

    def include_option
      {
        movies: []
      }
    end

    def init_user
      @user = User.new(user_params)
    end

    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
  end
end
