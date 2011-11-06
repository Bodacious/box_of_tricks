require 'spec_helper'


describe BoxOfTricksHelper do
    
  describe :title do
    
    it "should set the title if passed an arguement" do
      helper.title("HelloWorld")
      helper.instance_variable_get("@title").must_equal "HelloWorld"
    end
    
    it "should return the title if called without an argument" do
      helper.title("HelloWorld")      
      helper.title.must_equal "HelloWorld"
    end
    
  end
  
  describe :field do

    it "should return a div with class 'field'" do
      helper.field("").must_equal "<div class=\"field\"></div>"
    end

    it "should accept content as an argument" do
      helper.field("hello").must_equal "<div class=\"field\">hello</div>"
    end

    it "should accept content as a block" do
      helper.field { "hello" }.must_equal "<div class=\"field\">hello</div>"
    end

    it "should accept options for class, id and data" do
      helper.field("hello", id: "my_field", class: "other", data: {url: "/"}).
        must_be_dom_equal "<div class=\"other field\" id=\"my_field\" data-url=\"/\">hello</div>"      
      helper.field(id: "my_field", class: "other", data: {url: "/"}) { "hello" }.
        must_be_dom_equal "<div class=\"other field\" id=\"my_field\" data-url=\"/\">hello</div>"      
    end
    
  end
  
  describe :actions do
    
    it "should return a div with class 'actions'" do
      helper.actions("").must_equal "<div class=\"actions\"></div>"
    end

    it "should accept content as an argument" do
      helper.actions("hello").must_equal "<div class=\"actions\">hello</div>"
    end

    it "should accept content as a block" do
      helper.actions { "hello" }.must_equal "<div class=\"actions\">hello</div>"
    end

    it "should accept options for class, id and data" do
      helper.actions("hello", id: "my_field", class: "other", data: {url: "/"}).
        must_be_dom_equal "<div class=\"other actions\" id=\"my_field\" data-url=\"/\">hello</div>"      
      helper.actions(id: "my_field", class: "other", data: {url: "/"}) { "hello" }.
        must_be_dom_equal "<div class=\"other actions\" id=\"my_field\" data-url=\"/\">hello</div>"      
    end
      
  end
  
  describe :html5_shim do
    
    it "should add a conditional comment to the dom with script tag" do
      helper.html5_shim.must_be_dom_equal %{<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->}
    end
    
  end
  
  describe :clearfix do
    
     it "it should add a br tag with class 'clear'" do
       helper.clearfix.must_be_dom_equal %{<br class="clear">}
     end
    
  end
  
  describe :div do
    
    it "should accept content as an argument" do
      helper.div("bodacious").must_be_dom_equal %{<div>bodacious</div>}
    end
    
    it "should accept content as a block" do
      helper.div {"bodacious"}.must_be_dom_equal %{<div>bodacious</div>}
    end

    it "should accept options for attributes" do
      helper.div("hello", id: "my_field", class: "other").
        must_be_dom_equal "<div class=\"other\" id=\"my_field\">hello</div>"
        
      helper.div(id: "my_field", class: "other") { "hello" }.
        must_be_dom_equal "<div class=\"other\" id=\"my_field\">hello</div>"
    end    
  end

end

# class BoxOfTricksHelperTest < ActionView::TestCase
#   
#   test "title" do
#     title("Set Title")
#     assert_equal title, "Set Title"
#   end
#   
#   test "div_with_class" do
#     assert_dom_equal %{<div class="user">Bodacious</div>}, 
#       div_with_class(:user, "Bodacious")
#       
#     assert_dom_equal %{<div class="admin user">Bodacious</div>}, 
#       div_with_class(:user, "Bodacious", class: "admin") 
#       
#     assert_dom_equal %{<div class="admin user" id="user_1">Bodacious</div>}, 
#       div_with_class(:user, "Bodacious", class: "admin", id: "user_1") 
#       
#     assert_dom_equal %{<div class="admin user" id="user_1">Bodacious</div>}, 
#       div_with_class(:user, class: "admin", id: "user_1") { "Bodacious" }
#   end
#   
#   test "field" do
#     assert_dom_equal %{<div class="field"><p>hello</p></div>},
#       field { content_tag(:p, "hello") }
#       
#     assert_dom_equal %{<div class="field"><p>hello</p></div>},
#       field(content_tag(:p, "hello"))
#   end
#   
#   test "actions" do
#     assert_dom_equal %{<div class="actions">hello</div>},
#       actions { "hello" }
# 
#     assert_dom_equal %{<div class="actions">hello</div>},
#       actions("hello")
#   end
#   
#   test "div" do
#     assert_dom_equal %{<div>hello</div>},
#       div("hello")
#       
#     assert_dom_equal %{<div class="spaniel" id="hello_div" data-url="/">hello</div>},
#       div("hello", class: "spaniel", id: "hello_div", data: {url: "/"})
#       
#     assert_dom_equal %{<div class="muppet">Muppet 1</div>},
#       div(class: "muppet") { "Muppet 1" }
#   end
#   
#   test "html5_shim" do
#     assert_dom_equal %{<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->},
#       html5_shim
#   end
#   
#   test "clearfix" do
#     assert_dom_equal %{<br class="clear">}, clearfix    
#   end
#   
# end
