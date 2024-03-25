# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :user

  validates :youtube_id, :url, presence: true
  validates :youtube_id, uniqueness: true, if: -> { youtube_id.present? }

  with_options if: -> { url.present? } do
    validates :url, uniqueness: true
    validates :url, youtube_link_format: true
  end
end
