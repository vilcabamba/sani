pusher_url = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))["url"]

Pusher.url = pusher_url
Pusher.logger = Rails.logger
