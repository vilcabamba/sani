class BandangosController < ApplicationController
  before_action :require_login, :set_active, :find_business
  before_action :find_bandango, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    @bandango = @business.bandangos.new
  end

  def create
    @bandango = @business.bandangos.new bandango_params
    if @bandango.save
      flash.now[:notice] = "Creado"
      render :show
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if @bandango.update_attributes(bandango_params)
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
    @business = Business.cached_find params[:business_id]
  end
  def find_bandango
    @bandango = Bandango.cached_find params[:id]
  end
  def bandango_params
    params.require(:bandango).permit(:name)
  end

end
