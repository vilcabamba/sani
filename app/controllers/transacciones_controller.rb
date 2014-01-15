class TransaccionesController < BusinessController

  def index
    @transacciones = @business.transacciones.includes(:bandango).page(params[:page]).per(10)
  end
  
end
