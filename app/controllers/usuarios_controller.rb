class UsuariosController < ApplicationController
  before_filter :require_login
  authorize_resource

  def edit
    @usuario = current_user
  end

  def update
    @usuario = current_user
    @usuario.update! usuario_params
    redirect_to [:edit, current_user], notice: mensaje
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :recibe_notificaciones, :password, :password_confirmation)
  end

end