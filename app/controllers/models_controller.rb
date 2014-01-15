class ModelsController < ApplicationController
  before_action :require_login, :set_active
  before_action :find_model, only: [:edit, :update]
  
  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def edit  
  end

  def create
    @model = Model.new model_params
    if @model.save
      flash[:notice] = "Creado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if @model.update_attributes(model_params)
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
  def find_model
    @model = Model.cached_find params[:id]
  end
  def model_params
    params.require(:model).permit :name, :identificator
  end
  
end
