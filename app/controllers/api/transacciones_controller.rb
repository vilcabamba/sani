module Api
  class TransaccionesController < ApiController
    before_action :restrict_api_access

    def create
      respond_with :api, Transaccion.create!(
        bandango_id: session[:bandango_id],
              model: transaccion_params[:class_name],
             action: transaccion_params[:action],
              attrs: transaccion_params[:object],
               time: transaccion_params[:time])
    end

    private

    def transaccion_params
      @transaccion_params ||= params.require(:transaccion).permit(:action, :class_name, :object, :time)
    end
  end
end
