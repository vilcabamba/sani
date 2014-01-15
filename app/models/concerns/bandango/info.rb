class Bandango < ActiveRecord::Base
  module Info

    def nombre
      if name.blank?
        "Bandango #{id}"
      else
        name
      end
    end
    def last_connection_time
      @last_connection_time ||= last_connection.created_at if last_connection
    end
    def last_connection
      @last_connection ||= connections.last
    end
  end
end
