class ModelsController < ApplicationController
  before_action :require_login, :set_active
  before_action :require_admin, only: [:new, :edit, :create, :update]

  expose :models
  expose :model, attributes: :model_params

  def create
    if model.save
      flash[:notice] = "Creado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if model.save
      flash[:notice] = "Actualizado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No actualizado"
      render :edit
    end
  end

  private

  def set_active
    @navbar_active = "models"
  end

  def model_params
    params.require(:model).permit :name, :identificator
  end
end
