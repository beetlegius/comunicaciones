class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Excepciones

  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid
  rescue_from CanCan::AccessDenied, with: :access_denied

  before_action :set_variables

  helper_method :variables, :current_empresa, :current_organizacion

  def current_organizacion
    @current_organizacion ||= Organizacion.find_by url: request.host
  end

  def current_empresa
    @current_empresa ||= current_user.empresa if logged_in?
  end

  def variables
    @variables || {}
  end

  def set_variables(*args)
    @variables = args.extract_options!
    @variables[:title] ||= "#{controller_path}/#{action_name}".titleize
  end

  private

  def mensaje(clave = :notice, valor = action_name, *args)
    msj = t("#{clave}.#{valor}", *args)
    case clave
    when :notice
      flash.now.notice = msj
    when :alert
      flash.now.alert = msj
    end
  end

end