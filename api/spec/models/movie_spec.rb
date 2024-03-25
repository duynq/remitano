# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:youtube_id) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
