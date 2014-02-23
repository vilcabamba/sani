class BusinessController < BusinessesController
  before_action :require_login, :set_active

  expose(:business) {
    businesses.find params[:business_id]
  }

  protected

  def set_active
    @navbar_active = "businesses"
  end
end
