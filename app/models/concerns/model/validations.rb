class Model < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :name,          presence: true, uniqueness: true
      validates :identificator, presence: true
    end
  end
end
