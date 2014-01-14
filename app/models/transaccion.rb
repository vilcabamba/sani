# == Schema Information
#
# Table name: transacciones
#
#  id          :integer          not null, primary key
#  bandango_id :integer          not null
#  model       :string(255)      not null
#  action      :string(255)      not null
#  attrs       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Transaccion < ActiveRecord::Base
  include Validations

# serializations
  serialize :attrs

end
