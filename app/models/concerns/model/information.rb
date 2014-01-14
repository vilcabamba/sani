class Model < ActiveRecord::Base
  module Information
    extend ActiveSupport::Concern

    included do
      after_commit :flush_names_cache
    end

    def flush_names_cache
      Rails.cache.delete [self.class.name, "names"]
    end

    module ClassMethods
      def cached_names
        Rails.cache.fetch [name, "names"] do
          names
        end
      end
      def names
        pluck :name
      end
    end
  end
end
