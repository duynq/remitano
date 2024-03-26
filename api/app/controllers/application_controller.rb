# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Current
  include ApiRenderable
end
