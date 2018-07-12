Rails.application.configure do
  config.redis_connection = {
    host: ENV["REDIS_SIDEKIQ_HOST"],
    port: ENV["REDIS_SIDEKIQ_PORT"],
    db: ENV["REDIS_SIDEKIQ_DB"],
    password: ENV["REDIS_SIDEKIQ_PASSWORD"],
    network_timeout: 15
  }
end
