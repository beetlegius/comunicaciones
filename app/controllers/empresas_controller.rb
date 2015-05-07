class EmpresasController < ApplicationController
  before_filter :require_login, only: %w(show edit update destroy)
  load_and_authorize_resource except: %w(create), through: :current_organizacion
  before_filter :proteger_pendientes, only: %w(show edit update)

  def index
    @empresas = current_organizacion.empresas.habilitada
  end

  def show
    @empresa = current_user.empresa
    @comunicaciones = @empresa.comunicaciones
  end

  def new
  end

  def create
    @empresa = current_organizacion.empresas.build empresa_params
    @empresa.esta_habilitada = false
    @empresa.save!

    redirect_to root_path, notice: mensaje(:notice, :nueva_empresa)
  end

  def edit
  end

  def update
    @empresa.update! empresa_params
    redirect_to [:edit, @empresa], notice: mensaje
  end

  def destroy
    @empresa.destroy
    redirect_to solicitudes_path, notice: mensaje
  end

  def habilitar
    @empresa.habilitar!
    redirect_to solicitudes_path, notice: mensaje
  end

  private

  def empresa_params
    params.require(:empresa).permit(:nombre, :email, :color, :imagen, :imagen_url, :remove_imagen, usuarios_attributes: [:nombre, :email, :password, :password_confirmation])
  end

  def proteger_pendientes
    if !@empresa.esta_habilitada?
      logout
      redirect_to root_path
    end
  end

end