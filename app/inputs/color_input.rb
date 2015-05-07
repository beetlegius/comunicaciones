# -*- encoding : utf-8 -*-
class ColorInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field attribute_name, input_html_options.merge!(type: :color, class: 'input-sm')
  end
end
