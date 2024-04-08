# frozen_string_literal: true

module RequestMacros
  def fake_user_login(user)
    secret_key_base = Rails.application.credentials.secret_key_base
    JWT.encode({ user_id: user.id, email: user.email }, secret_key_base, 'HS256')
  end
end
