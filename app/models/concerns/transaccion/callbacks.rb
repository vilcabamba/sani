class Transaccion < ActiveRecord::Base
  module Callbacks
    extend ActiveSupport::Concern

    included do
      after_create :send_to_pusher
    end

    def send_to_pusher
      TransaccionCreatedPusherWorker.perform_async id
    end
  end
end
