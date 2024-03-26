# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Users' do
  let(:json_body) { response.parsed_body }

  describe '#Create' do
    before do
      post '/api/users', params: params, headers: headers
    end

    context 'when the request is valid' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      let(:params) do
        {
          user: {
            name: 'Test',
            email: 'test+1@gmail.com'
          }
        }
      end

      it 'creates a user' do

        expect(response).to have_http_status(:created)
      end
    end
  end
end
