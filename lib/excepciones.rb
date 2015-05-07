module Excepciones

  def access_denied
    redirect_to login_path
  end

  def not_authenticated
    redirect_to login_path
  end

  def routing_error
    redirect_to root_url
  end

  def record_invalid(excepcion)
    flash.now.alert = excepcion.message
    if excepcion.record && defined?(excepcion.record.class::ATRIBUTOS_IMAGEN)
      excepcion.record.class::ATRIBUTOS_IMAGEN.each do |atributo|
        excepcion.record.send "#{atributo}=", nil if excepcion.record.errors[atributo].any?
      end
    end

    case action_name
    when 'create' then
      new
      render :new
    when 'update' then
      show
      render :show
    end
  end

end
