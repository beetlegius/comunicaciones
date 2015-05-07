class MensajesController < ApplicationController
  before_filter :require_login
  load_resource :comunicacion, through: :current_empresa

  def create
    @mensaje = @comunicacion.mensajes.build mensaje_params
    @mensaje.usuario = current_user
    @mensaje.save!

    redirect_to @comunicacion, notice: mensaje
  end

  private

  def mensaje_params
    params.require(:mensaje).permit(:contenido, :archivo)
  end

end