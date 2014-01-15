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
#  time        :datetime         not null
#

class Transaccion < ActiveRecord::Base
  include Caching
  include Pusherable
  include Validations
  include Identificable

# scopes
  default_scope { order("id DESC") }

# serializations
  serialize :attrs

# relationships
  belongs_to :bandango

  def self.max_id
    maximum(:id) || 0
  end

end
