# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Users' do
  let(:json_body) { response.parsed_body }
  let!(:user) { create(:user, email: 'test@gmail.com') }

  describe '#Create' do
    before do
      post '/api/users', params: params.to_json, headers: headers
    end

    context 'when the request is valid' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: 'test+1@gmail.com',
          password: '123123'
        }
      end

      it 'creates a user' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the password is empty' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: 'test+1@gmail.com',
          password: ''
        }
      end

      it 'return the password blank error' do
        expect(json_body['detail']['password'][0]).to eq "Password can't be blank"
      end
    end

    context 'when the email is empty' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: '',
          password: '123123'
        }
      end

      it 'return the email blank error' do
        expect(json_body['detail']['email'][0]).to eq "Email can't be blank"
      end
    end

    context 'when the email is invalid' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: 'test',
          password: '123123'
        }
      end

      it 'return the email wrong format error' do
        expect(json_body['detail']['email'][0]).to eq 'Email is wrong format'
      end
    end

    context 'when the email is already taken' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: 'test@gmail.com',
          password: '123123'
        }
      end

      it 'return the email error' do
        expect(json_body['detail']['email'][0]).to eq 'Email has already been taken'
      end
    end
  end
end
