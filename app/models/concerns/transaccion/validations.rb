class Transaccion < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :bandango_id, presence: true
      validates :model,       presence: true
      validates :action,      presence: true
    end
  end
end
