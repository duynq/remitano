# frozen_string_literal: true

module ModelConstants
  EMAIL_REGEXP = /\A(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(".+"))@(([^<>()\[\]\.,;:\s@\"]+\.)+[^<>()\[\]\.,;:\s@\"]{2,})\z/
  YOUTUBE_LINK_REGEXP = %r{^((?:https?:)?//)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(/(?:[\w\-]+\?v=|embed/|v/)?)([\w\-]+)(\S+)?$}
end
