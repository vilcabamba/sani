class Business < ActiveRecord::Base
  include Tokenizable

# relationships
  has_many :bandangos
  
end
