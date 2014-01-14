class ApiController < ApplicationController
  respond_to :json

  protected

  def restrict_api_access
    authenticate_or_request_with_http_token do |token, options|
      Bandango.cached_find_by_token(token).tap do |bandango|
        session[:bandango_id] = bandango.id if bandango
      end
    end
  end
end
