require 'test_helper'

class BoxOfTricksHelperTest < ActionView::TestCase
  
  test "title" do
    title("Set Title")
    assert_equal title, "Set Title"
  end
  
  test "div_with_class" do
    assert_dom_equal %{<div class="user">Bodacious</div>}, 
      div_with_class(:user, "Bodacious")
      
    assert_dom_equal %{<div class="admin user">Bodacious</div>}, 
      div_with_class(:user, "Bodacious", class: "admin") 
      
    assert_dom_equal %{<div class="admin user" id="user_1">Bodacious</div>}, 
      div_with_class(:user, "Bodacious", class: "admin", id: "user_1") 
      
    assert_dom_equal %{<div class="admin user" id="user_1">Bodacious</div>}, 
      div_with_class(:user, class: "admin", id: "user_1") { "Bodacious" }
  end
  
  test "field" do
    assert_dom_equal %{<div class="field"><p>hello</p></div>},
      field { content_tag(:p, "hello") }
      
    assert_dom_equal %{<div class="field"><p>hello</p></div>},
      field(content_tag(:p, "hello"))
  end
  
  test "actions" do
    assert_dom_equal %{<div class="actions">hello</div>},
      actions { "hello" }

    assert_dom_equal %{<div class="actions">hello</div>},
      actions("hello")
  end
  
  test "div" do
    assert_dom_equal %{<div>hello</div>},
      div("hello")
      
    assert_dom_equal %{<div class="spaniel" id="hello_div" data-url="/">hello</div>},
      div("hello", class: "spaniel", id: "hello_div", data: {url: "/"})
      
    assert_dom_equal %{<div class="muppet">Muppet 1</div>},
      div(class: "muppet") { "Muppet 1" }
  end
  
end
