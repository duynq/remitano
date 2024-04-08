# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :youtube_id, uniqueness: true, if: -> { youtube_id.present? }

  before_validation :set_youtube_data, if: -> { url.present? && url_changed? }

  private

  def set_youtube_data
    movie = VideoInfo.new(url)
    self.youtube_id = movie.video_id
    self.title = movie.title
    self.description = movie.description
  rescue VideoInfo::UrlError
    errors.add(:url, 'is not a valid YouTube URL')
  end
end
