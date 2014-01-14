class Transaccion < ActiveRecord::Base
  module Identificable
    extend ActiveSupport::Concern

    def identificator
      Model.identificator_for self.model
    end
  end
end
