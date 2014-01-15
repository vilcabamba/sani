# == Schema Information
#
# Table name: bandango_connections
#
#  id                 :integer          not null, primary key
#  bandango_id        :integer          not null
#  transacciones_sent :text
#  created_at         :datetime
#

class BandangoConnection < ActiveRecord::Base
  include Validations
  include Despachable

# scopes
  default_scope { order("id DESC") }

# relationships
  belongs_to :bandango

# serializations
  serialize :transacciones_sent, Array

end
