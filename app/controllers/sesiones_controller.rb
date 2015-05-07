# -*- encoding : utf-8 -*-
class SesionesController < ApplicationController
  before_action :proteger_login, except: :destroy
  before_action :set_info, only: [:new, :create]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new usuario_params
    login @usuario.email, @usuario.password
    if logged_in? && current_organizacion.usuarios.include?(current_user)
      redirect_to ubicar, notice: mensaje(:notice, :sesion_iniciada)
    else
      logout
      mensaje(:alert, :sesion_no_iniciada)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: notice, alert: alert
  end

  private

  def proteger_login
    if logged_in?
      logout
      redirect_to login_path
    end
  end

  def set_info
    set_variables title: "Iniciar sesión", description: "Iniciar sesión para participar en las conversaciones", keywords: "login, comunicaciones"
  end

  def usuario_params
    params.require(:usuario).permit(:email, :password)
  end

  def ubicar
    case current_user.rol
    when Usuario::SUPERADMIN then root_path
    when Usuario::EMPRESA then current_user.empresa
    else root_path
    end
  end

end
