class ApplicationController
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_bandango
    end

    def current_bandango
      @current_bandango ||= Bandango.cached_find(session[:bandango_id]) if session[:bandango_id]
    end

    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end

    def require_login
      redirect_to login_path unless current_user
    end

    def require_admin
      redirect_to root_path unless current_user.admin?
    end
  end
end
