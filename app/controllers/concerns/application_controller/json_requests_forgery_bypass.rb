class ApplicationController < ActionController::Base
  module JSONRequestsForgeryBypass
    extend ActiveSupport::Concern

    included do
      skip_before_action :verify_authenticity_token, if: :json_request?
    end

    protected

    def json_request?
      request.headers["Content-Type"].split("; ").include?("application/json") unless request.headers["Content-Type"].blank?
    end
  end
end
