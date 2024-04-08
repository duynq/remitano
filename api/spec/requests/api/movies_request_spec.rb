# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Movies' do
  let(:json_body) { response.parsed_body }
  let!(:user) { create(:user) }
  let!(:movie) { create(:movie, user: user, url: 'https://www.youtube.com/watch?v=DAfPonQjoAY') }
  let!(:token) { fake_user_login(user) }

  describe 'index' do
    before do
      get '/api/movies'
    end

    it 'returns movies' do
      expect(response).to have_http_status(:ok)
      expect(json_body['movies'].size).to eq(1)
    end
  end

  describe 'create' do
    before do
      post '/api/movies', params: params.to_json, headers: headers
    end

    context 'when user have not login' do
      let(:headers) { { 'Content-Type' => 'application/json' } }
      let(:params) do
        {
          url: 'https://www.youtube.com/watch?v=VXtCZYNCXRU'
        }
      end

      it 'return unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request is valid' do
      let(:headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" } }

      let(:params) do
        {
          url: 'https://www.youtube.com/watch?v=VXtCZYNCXRU'
        }
      end

      it 'creates a movie' do
        expect(response).to have_http_status(:created)
        expect(json_body['youtube_id']).to eq('VXtCZYNCXRU')
        expect(json_body['user_id']).to eq(user.id)
      end
    end

    context 'when the url is empty' do
      let(:headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" } }

      let(:params) do
        {
          url: ''
        }
      end

      it 'return the url blank error' do
        expect(json_body['detail']['url'][0]).to eq "URL can't be blank"
      end
    end

    context 'when the url is invalid' do
      let(:headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" } }

      let(:params) do
        {
          url: 'invalid_url'
        }
      end

      it 'return the url invalid error' do
        expect(json_body['detail']['url'][0]).to eq 'URL is not a valid YouTube URL'
      end
    end
  end
end
