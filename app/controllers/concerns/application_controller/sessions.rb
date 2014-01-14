class ApplicationController
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_bandango
    end

    def current_bandango
      @current_bandango ||= Bandango.cached_find(session[:bandango_id]) if session[:bandango_id]
    end
  end
end
