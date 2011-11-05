module BoxOfTricksHelper
  
  # Sets the page title if passed an argument, otherwise returns the page title.
  #   # layouts/application.html.erb
  #   <DOCTYPE!>
  #   <html>
  #   <head>
  #     <title><%= title %></title>
  #   </head>
  #   <body>
  #     <%= yield %>
  #   </body>
  #   </html>
  # 
  #   # users/show.hmtl.erb
  #   <% title @user.username %>
  # Content may be passed as a block or as the first argument
  # @author Gavin Morrice  
  def title(content = nil)
    content ? @content = content : @content
  end
  
  # Creates a div with class 'field'. All of the usual options may also be applied
  # here including the class argument.
  #   <%= field "Hello", class: "my_field", id: "field_1" %>
  #   <!-- generates -->
  #   <div class="my_field field" id="field_1">Hello</div>
  # Content may be passed as a block or as the first argument
  # @author Gavin Morrice
  def field(*args, &block)
    div_with_class(:field, *args, &block)
  end

  # Creates a div with class 'actions'. All of the usual options may also be applied
  # here including the class argument.
  #   <%= actions class: "sign_up_actions", id: "sign_up_links" do %>
  #     <%= f.submit "Sign Up" %>
  #   <% end %>
  #   <!-- generates -->
  #   <div class="actions sign_up_actions" id="sign_up_links">
  #     <input type="submit" value="Sign Up">
  #   </div>
  # Content may be passed as a block or as the first argument
  # @author Gavin Morrice
  def actions(*args, &block)
    div_with_class(:actions, *args, &block)
  end
  
  # Creates a div tag. This is basically a short-hand for
  #   content_tag(:div)
  # @author Gavin Morrice
  def div(*args, &block)
    content_tag(:div, *args, &block)
  end
  
  # Load a JS file if browser is Internet Explorer to ensure backward-compatibility
  # of HTML5 elements
  def html5_shim
    %{<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->}.html_safe
  end
  
  
private

  # Create a div with default class. This is used as a helper to the other
  # div helper methods.
  # @note This should be the first child of your document's head element
  def div_with_class(*args, &block)
    tag_with_class :div, *args, &block
  end

  # Create a tag with a default class. This is used as a helper to the 
  # other tag helper methods
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
