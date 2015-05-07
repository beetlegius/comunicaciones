class OrganizacionesController < ApplicationController
  before_filter :require_login
  authorize_resource

  def solicitudes
    @empresas = current_organizacion.empresas.pendiente
  end

end