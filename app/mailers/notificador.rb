# Class description
class Notificador < ActionMailer::Base
  helper :application
  default css: :email, from: "Comunicaciones <comunicaciones@xaver.com.ar>"

  def mensaje(mensaje)
    @mensaje = mensaje
    @comunicacion = mensaje.comunicacion
    @usuario = mensaje.usuario
    para = "noreply@comunicaciones.xaver.com.ar"
    bcc = @comunicacion.emails - [@usuario.email]
    asunto = "#{@usuario.nombre_completo} escribió en #{@comunicacion.asunto} | #{view_context.fecha Date.today}"
    mail to: para, bcc: bcc, subject: asunto
  end

end
