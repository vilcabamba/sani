class Bandango < ActiveRecord::Base
  module BandangoTransacciones

    def transacciones_since(since=0)
      cached_business.transacciones.where.not(bandango_id: id).where("transacciones.id > ?", since).order(:time)
    end
  end
end
