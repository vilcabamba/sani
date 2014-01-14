class Transaccion < ActiveRecord::Base
  module Caching
    
    def cached_business
      cached_bandango.cached_business
    end
    def cached_bandango
      Bandango.cached_find bandango_id
    end
  end
end
