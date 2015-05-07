class ComunicacionesController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource except: %w(create)

  def show
  end

  def new
  end

  def create
    @comunicacion = current_empresa.comunicaciones_iniciadas.build comunicacion_params
    @comunicacion.mensajes.each { |mensaje| mensaje.usuario = current_user }
    @comunicacion.save!

    redirect_to @comunicacion, notice: mensaje
  end

  def destroy
    @comunicacion.destroy
    redirect_to @comunicacion.empresa, notice: mensaje
  end

  private

  def comunicacion_params
    params.require(:comunicacion).permit(:asunto, empresa_ids: [], mensajes_attributes: [:contenido, :archivo, :remove_archivo])
  end

end