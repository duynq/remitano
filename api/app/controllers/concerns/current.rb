# frozen_string_literal: true

module Current
  thread_mattr_accessor :user

  extend ActiveSupport::Concern

  included do
    around_action :set_current_user
  end

  protected

  def secret_key_base
    Rails.application.credentials.secret_key_base
  end

  def issue_token(user)
    JWT.encode({user_id: user.id}, secret_key_base, 'HS256')
  end

  def decoded_token
    JWT.decode(token, secret_key_base, true, { :algorithm => 'HS256' })
  end

  def token
    request.headers['Authorization']
  end

  def user_id
    decoded_token.first['user_id']
  end

  def logged_in?
    !!current_user
  end

  private

  def set_current_user
    Current.user = User.find_by(id: user_id)
    yield
  ensure
    Current.user = nil
  end
end
