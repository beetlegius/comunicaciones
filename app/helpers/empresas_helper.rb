module EmpresasHelper

  def input_empresa(empresa)
    content_tag :span, (imagen(empresa.imagen, '24x24', '#c', { class: 'img-responsive' }) + empresa.nombre), class: :input_empresa
  end

end