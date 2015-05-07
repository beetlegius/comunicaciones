# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'form-group row', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper :div, class: 'col-lg-2' do |ba|
      ba.use :label
    end
    b.wrapper :div, class: 'col-lg-6' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block inline' }
    end
  end

  config.wrappers :inline, tag: :span, class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block inline' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block inline' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
