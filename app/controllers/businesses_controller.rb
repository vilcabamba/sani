class BusinessesController < ApplicationController
  before_action :require_login, :set_active

  expose(:businesses) {
    if current_user.admin?
      Business.all.includes(:user)
    else
      current_user.businesses
    end
  }

  expose(:business) {
    businesses.find params[:id]
  }

  def new
    self.business = Business.new
  end

  def create
    self.business = current_user.businesses.new business_params
    if business.save
      flash.now[:notice] = "Creado"
      render :show
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if business.update_attributes(business_params)
      flash.now[:notice] = "Actualizado"
      render :show
    else
      flash.now[:notice] = "No actualizado"
      render :edit
    end
  end

  private

  def set_active
    @navbar_active = "businesses"
  end

  def business_params
    params.require(:business).permit(:nombre)
  end
end
