# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Sessions' do
  let(:json_body) { response.parsed_body }
  let!(:user) { create(:user, password: '123456') }

  describe 'create' do
    before do
      post '/api/sign_in', params: params.to_json, headers: headers
    end

    context 'when login successfully' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          email: user.email,
          password: '123456'
        }
      end

      it 'returns token' do
        expect(response).to have_http_status(:ok)
        expect(json_body['token']).to be_present
      end
    end

    context 'when login failed' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      context 'when the wrong email' do
        let(:params) do
          {
            email: 'test@gmail.com',
            password: '123456'
          }
        end

        it 'returns unauthorized' do
          expect(response).to have_http_status(:unauthorized)
          expect(json_body['error']).to eq 'Invalid email or password'
        end
      end

      context 'when the wrong password' do
        let(:params) do
          {
            email: user.email,
            password: '1234567'
          }
        end

        it 'returns unauthorized' do
          expect(response).to have_http_status(:unauthorized)
          expect(json_body['error']).to eq 'Invalid email or password'
        end
      end
    end
  end
end
