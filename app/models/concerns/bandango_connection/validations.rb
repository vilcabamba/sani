class BandangoConnection < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :bandango_id, presence: true
    end
  end
end
