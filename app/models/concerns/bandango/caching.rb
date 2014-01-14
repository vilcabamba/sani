class Bandango < ActiveRecord::Base
  module Caching

    def cached_business
      @cached_business ||= Business.cached_find(business_id)
    end
  end
end
