class TransaccionesController < BusinessController

  def index
    @transacciones = @business.transacciones.includes(:bandango).page(params[:page]).per(10)
  end

  def show
    @transacciones = Transaccion.where(id: params[:id]).page
    render :index
  end
  
end
