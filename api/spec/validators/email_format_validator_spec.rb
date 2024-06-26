# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailFormatValidator do
  let(:user) { User.new(name: 'Test User', email: email, password: '123123') }

  context 'when valid email' do
    let(:email) { 'test@example.com' }

    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'when invalid email' do
    let(:email) { 'invalid_email' }

    it 'is not valid' do
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include(I18n.t('activerecord.errors.models.user.attributes.email.invalid_format'))
    end
  end
end
