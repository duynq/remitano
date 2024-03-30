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
    JWT.encode({ user_id: user.id, email: user.email }, secret_key_base, 'HS256')
  end

  def decoded_token
    JWT.decode(token, secret_key_base, true, { algorithm: 'HS256' })
  rescue StandardError
    Rails.logger.error('Invalid Token')

    [{ error: 'Invalid Token' }]
  end

  def token
    request.headers['Authorization']&.split&.last
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end

  def user_signed_in?
    current_user.present?
  end

  private

  def set_current_user
    Current.user = current_user if user_signed_in?
    yield
  ensure
    Current.user = nil
  end
end
