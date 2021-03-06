# == Schema Information
#
# Table name: bandangos
#
#  id          :integer          not null, primary key
#  business_id :integer          not null
#  name        :string(255)
#  token       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Bandango < ActiveRecord::Base
  include Info
  include Caching
  include Validations
  include Tokenizable
  include BandangoTransacciones

# relationships
  belongs_to :business
  has_many :transacciones
  has_many :connections, class_name: BandangoConnection

end
