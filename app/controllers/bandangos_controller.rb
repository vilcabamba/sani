class BandangosController < BusinessController
  before_action :find_bandango, only: [:show, :edit, :update]
  before_action :find_connections, only: [:show, :create, :update]

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

  def find_bandango
    @bandango = Bandango.cached_find params[:id]
  end

  def bandango_params
    params.require(:bandango).permit(:name)
  end

  def find_connections
    @connections = @bandango.connections.page(params[:page]).per(10)
  end
end
