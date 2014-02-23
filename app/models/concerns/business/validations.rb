class Business < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :nombre, presence: true, uniqueness: true
      validates :user_id, presence: true
    end
  end
end
