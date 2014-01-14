class BusinessesController < ApplicationController
  before_action :require_login, :set_active

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.cached_find params[:id]
  end

  private

  def set_active
    @navbar_active = "businesses"
  end
  
end
