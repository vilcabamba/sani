class Bandango < ActiveRecord::Base
  include Tokenizable

# relationships
  belongs_to :business

end
