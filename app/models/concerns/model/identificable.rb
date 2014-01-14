class Model < ActiveRecord::Base
  module Identificable
    extend ActiveSupport::Concern

    module ClassMethods
      def identificator_for(name)
        cached_find_by_name(name: name).identificator
      end
    end
  end
end
