# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :movies, dependent: :destroy

  validates :email, presence: true
  with_options if: -> { email.present? } do
    validates :email, uniqueness: true
    validates :email, email_format: true
  end
end
