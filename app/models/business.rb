# == Schema Information
#
# Table name: businesses
#
#  id         :integer          not null, primary key
#  nombre     :string(255)      not null
#  token      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Business < ActiveRecord::Base
  include Tokenizable
  include Validations

# relationships
  has_many :bandangos
  has_many :transacciones, through: :bandangos
  
end
