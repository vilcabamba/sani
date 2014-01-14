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

# relationships
  has_many :bandangos
  
end
