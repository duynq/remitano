module Api
  class UsersController < ApplicationController
    before_action :init_user, only: :create

    def create
      binding.pry
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
