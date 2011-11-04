module BoxOfTricksHelper
  
  # Create a div with class field
  # (Useful for form fields)
  def field(*args, &block)
    div_with_class(:field, *args, &block)
  end

  # Create a div with class actions
  # (Useful for form actions)  
  def actions(*args, &block)
    div_with_class(:actions, *args, &block)
  end
  
  def div(*args, &block)
    content_tag(:div, *args, &block)
  end
  
  # Create a div with default class. This is used as a helper to the other
  # div helper methods
  def div_with_class(*args, &block)
    tag_with_class :div, *args, &block
  end
  
private
  
  def tag_with_class(*args, &block)
    options  = args.extract_options!
    tag_name = args.first
    klass    = args[1]
    
    if block_given?
      content = capture(&block)
    else
      content = args.last
    end
    options[:class] = "#{options[:class]} #{klass}".strip
    content_tag(tag_name, content, options)
  end
  
end
