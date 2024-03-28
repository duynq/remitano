# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :init_user, only: :create

    def create
      @user.save!
      token = issue_token(@user)
      render json: { token:, user: user_data(@user) }, status: :created
    end

    private

    def init_user
      @user = User.new(user_params)
    end

    def user_data(user)
      UserSerializer.new(user)
    end

    def user_params
      params.permit(:email, :password)
    end
  end
end
