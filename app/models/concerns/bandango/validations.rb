# encoding: utf-8
class Bandango < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :name, presence: true
      validate  :name_unique_in_business
    end

    def name_unique_in_business
      cached_business.bandangos.where(name: name).each do |bandango|
        if bandango != self
          errors.add :name, "Ya existe dentro de este negocio"
        end
      end
    end
  end
end
