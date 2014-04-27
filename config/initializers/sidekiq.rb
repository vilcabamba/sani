redis_host = ENV["REDIS_HOST"] || "redis://localhost:6379"
base_conf = { url: redis_host, namespace: "#{Rails.application.class.parent_name}_#{Rails.env}" }

Sidekiq.configure_server do |config|
  config.redis = base_conf
end

Sidekiq.configure_client do |config|
  config.redis = base_conf
end
