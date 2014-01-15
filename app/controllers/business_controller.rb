class BusinessController < ApplicationController
  before_action :require_login, :set_active, :find_business

  protected

  def set_active
    @navbar_active = "businesses"
  end
  def find_business
    @business = Business.cached_find params[:business_id]
  end

end
