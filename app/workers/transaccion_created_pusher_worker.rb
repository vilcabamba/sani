class TransaccionCreatedPusherWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform(transaccion_id)
    transaccion = Transaccion.cached_find transaccion_id
    business = transaccion.cached_business
    Pusher[business.token].trigger("new_transaccion")
  end
end
