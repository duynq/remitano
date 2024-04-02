# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Current
  include ApiRenderable
  include ApiPaginate

  before_action :authenticate_user!

  private

  def authenticate_user!
    render error: :bad_credentials unless user_signed_in?
  end
end
