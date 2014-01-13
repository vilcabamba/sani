module Tokenizable
  extend ActiveSupport::Concern

  included do
    before_create :create_token!
  end

  def create_token!
    begin
      self.token = SecureRandom.hex(50)
    end while self.class.exists?(token: token)
  end

  module ClassMethods
    def cached_find_by_token(token)
      Rails.cache.fetch [name, "token", token] do
        find_by token: token
      end
    end
  end
end
