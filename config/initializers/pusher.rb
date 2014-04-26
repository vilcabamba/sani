pusher_url = "http://#{ENV["PUSHER_KEY"]}:#{ENV["PUSHER_SECRET"]}@api.pusherapp.com/apps/#{ENV["PUSHER_APP_ID"]}"
Pusher.url = pusher_url
Pusher.logger = Rails.logger
