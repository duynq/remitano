# frozen_string_literal: true

class YoutubeLinkFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if ModelConstants::YOUTUBE_LINK_REGEXP.match?(value)

    record.errors.add(attribute, :invalid_format)
  end
end
