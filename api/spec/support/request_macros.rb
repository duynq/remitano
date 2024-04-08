# frozen_string_literal: true

module RequestMacros
  def fake_user_login(user)
    login_as user, scope: :user
  end
end
