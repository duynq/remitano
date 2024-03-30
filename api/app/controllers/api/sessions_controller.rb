# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user!

    def create
      user = User.find_by(email: user_params[:email])

      if user&.authenticate(user_params[:password])
        token = issue_token(user)
        render json: { token: }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
