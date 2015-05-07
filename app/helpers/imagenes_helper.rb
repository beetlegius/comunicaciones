module ImagenesHelper

  def imagen(imagen, tamano, opciones = nil, html_options = {}, opciones_procesamiento = {})

    # Esta linea es para que la app funcione en development sin utilizar S3 y morir en el intento
    # return image_tag "default.png", html_options if Rails.env.development?
    #
    if imagen.present?
      image_tag imagen_path(imagen, tamano, opciones, opciones_procesamiento), html_options
    else
      html_options[:data] ||= {}
      html_options[:data][:src] = holder_path(tamano, opciones_procesamiento[:placeholder])
      image_tag 'default.png', html_options
    end
  end

  def imagen_path(imagen, tamano, opciones = nil, opciones_procesamiento = {})
    imagen = imagen.thumb(tamano + opciones.to_s)
    imagen = imagen.convert("+sigmoidal-contrast 100%") if opciones_procesamiento[:white]
    imagen = imagen.convert("-sigmoidal-contrast 100%") if opciones_procesamiento[:black]
    # imagen = imagen.process(:watermark) if opciones_procesamiento[:watermark] A HABILITAR CUANDO ESTÉ UTILIZABLISIMO!
    imagen.url
  end

  def holder_path(tamano, texto = nil)
    holder = "holder.js/#{tamano}"
    holder += "/text:#{texto}" if texto.present?
    return holder
  end

end