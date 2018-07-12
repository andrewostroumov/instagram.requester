Sidekiq.configure_server do |config|
  config.redis = Rails.application.config.redis_connection
end

Sidekiq.configure_client do |config|
  config.redis = Rails.application.config.redis_connection
end