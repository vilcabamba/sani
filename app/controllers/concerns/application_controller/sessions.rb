class ApplicationController
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_bandango
    end

    def current_bandango
      @current_bandango ||= Bandango.cached_find(session[:bandango_id]) if session[:bandango_id]
    end
    def require_login
      unless current_user
        redirect_to login_path
        false
      end
    end
  end
end
