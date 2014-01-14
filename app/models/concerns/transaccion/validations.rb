class Transaccion < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :bandango_id, presence: true
      validates :action,      presence: true
      validates :time,        presence: true
      validates :model,       presence: true,
                              inclusion: { in: Model.cached_names }
    end
  end
end
