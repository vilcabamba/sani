class BandangoConnection < ActiveRecord::Base
  module Despachable
    extend ActiveSupport::Concern

    module ClassMethods
      def dispatched_to(bandango, transacciones)
        create! bandango_id: bandango.id,
         transacciones_sent: transacciones.map(&:id)
      end
    end
  end
end
