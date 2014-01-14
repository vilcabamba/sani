class Bandango < ActiveRecord::Base
  module Info

    def nombre
      if name.blank?
        "Bandango #{id}"
      else
        name
      end
    end
  end
end
