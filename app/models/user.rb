# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)      not null
#  email            :string(255)      not null
#  crypted_password :string(255)      not null
#  salt             :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include GravatarImagen

# relationships
  has_many :businesses

# methods
  def to_s
    username
  end

end
