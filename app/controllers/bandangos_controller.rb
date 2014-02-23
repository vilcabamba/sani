class BandangosController < BusinessController

  expose(:bandango) {
    business.bandangos.find params[:id]
  }
  expose(:connections) {
    bandango.connections.page(params[:page]).per(10)
  }

  def new
    self.bandango = business.bandangos.new
  end

  def create
    self.bandango = business.bandangos.new bandango_params
    if bandango.save
      flash.now[:notice] = "Creado"
      render :show
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if bandango.update_attributes(bandango_params)
      flash.now[:notice] = "Actualizado"
      render :show
    else
      flash.now[:notice] = "No actualizado"
      render :edit
    end
  end

  private

  def bandango_params
    params.require(:bandango).permit(:name)
  end
end
