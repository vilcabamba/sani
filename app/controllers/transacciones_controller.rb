class TransaccionesController < BusinessController

  expose(:transacciones) {
    business.transacciones.includes(:bandango).page(params[:page]).per(10)
  }
  expose(:transaccion) {
    business.transacciones.find params[:id]
  }

  def index
  end

  def show
  end

end
