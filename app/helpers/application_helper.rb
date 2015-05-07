module ApplicationHelper

  CLASES = { alert: :danger, notice: :success, info: :info }

  IMAGEN_DIMENSIONES = {
    chico: '187x140',
    mediano: '394x270',
    grande: '593x310'
  }

  def bootstrap_flash
    flash.map do |key, mensaje|
      content_tag :div, class: ['alert', 'alert-dismissible', "alert-#{CLASES[key.to_sym]}"], role: :alert do
        button_tag(fa_icon(:times) + content_tag(:span, 'Cerrar', class: 'sr-only'), class: :close, data: { dismiss: :alert }) + mensaje
      end
    end.join.html_safe
  end

  def fecha(una_fecha, opciones = {})
    una_fecha.present? ? l(una_fecha, opciones) : "-"
  end

end
