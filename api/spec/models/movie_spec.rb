# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#set_youtube_data' do
    context 'when url is valid' do
      let(:movie) { build(:movie, url: 'https://www.youtube.com/watch?v=DAfPonQjoAY') }

      it 'sets youtube_id' do
        movie.valid?
        expect(movie.youtube_id).to eq('DAfPonQjoAY')
      end
    end

    context 'when url is invalid' do
      let(:movie) { build(:movie, url: 'invalid_url') }

      it 'adds error' do
        movie.valid?
        expect(movie.errors[:url]).to include('is not a valid YouTube URL')
      end
    end
  end
end
