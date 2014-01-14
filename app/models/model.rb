# == Schema Information
#
# Table name: models
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  identificator :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Model < ActiveRecord::Base
  include Validations
  include Information

end
