module FormHelper

  def tr_for(objeto, *args, &block)
    content_tag :tr, data: { id: objeto.id }, id: objeto.to_param do
      yield
    end
  end

  def thead(*args)
    content_tag :thead, content_tag(:tr, args.map { |arg| arg, options = arg if arg.is_a?(Array); content_tag(:th, arg.to_s.humanize, options) }.join.html_safe)
  end

  def submit_button(form, anchor = nil, html_options = {}, *args)
    options = args.extract_options!
    html_options.reverse_merge! name: nil
    html_options[:class] = [html_options[:class], 'btn btn-primary'].compact
    anchor ||= form.object.new_record? ? t("helpers.submit.create", model: form.object.class.model_name.human.downcase) : t("helpers.submit.update", model: form.object.class.model_name.human.downcase)
    html_options[:data] ||= {}
    html_options[:data].reverse_merge! disable_with: "#{fa_icon(options[:icono], text: anchor)}" unless options[:modal]
    button = form.button(:button, fa_icon(options[:icono], text: anchor), html_options)
    options[:simple] ? button : content_tag(:div, button, class: 'form-actions')
  end

end