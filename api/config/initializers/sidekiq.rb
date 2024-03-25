# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['KVS_HOST']}:6379/2" }
  config.default_job_options = { retry: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['KVS_HOST']}:6379/2" }
  config.default_job_options = { retry: 5 }
end

case Rails.env.to_sym
when :production
  Sidekiq.logger = Logger.new($stdout)
  Sidekiq.logger.level = Logger::INFO
when :development
  Sidekiq.logger = Logger.new($stdout)
  Sidekiq.logger.level = Logger::INFO
when :test
  Sidekiq.logger = nil
end
