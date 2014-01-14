class Model < ActiveRecord::Base
  module Caching
    extend ActiveSupport::Concern

    included do
      after_commit :flush_name_cache
    end

    def flush_name_cache
      Rails.cache.delete [self.class.name, "name", name]
    end

    module ClassMethods
      def cached_find_by_name(model_name)
        Rails.cache.fetch [name, "name", model_name] do
          find_by_name model_name
        end
      end
      def find_by_name(name)
        find_by(name: name)
      end
    end
  end
end
