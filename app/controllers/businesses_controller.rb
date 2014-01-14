class BusinessesController < ApplicationController
  before_action :require_login, :set_active
  before_action :find_business, only: [:show, :edit, :update]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def create
    @business = Business.new business_params
    if @business.save
      flash.now[:notice] = "Creado"
      render :show
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if @business.update_attributes(business_params)
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
  def find_business
    @business = Business.cached_find params[:id]
  end
  def business_params
    params.require(:business).permit(:nombre)
  end
  
end
