# frozen_string_literal: true

module ModelConstants
  EMAIL_REGEXP = Regexp.new(/\A(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()\[\]\.,;:\s@\"]+\.)+[^<>()\[\]\.,;:\s@\"]{2,})\z/)
end
