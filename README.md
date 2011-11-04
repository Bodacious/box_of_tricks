# [Box of Tricks](http://github.com/KatanaCode/box_of_tricks "Katana Code's Box of Tricks")

This gem contains a bunch of CSS classes and Rails helper methods that we rely upon regularly

## View Helpers

### BoxOfTricks#field

``` rhtml
<%= field id: "my_field", class: "user_form" do %>
  <%= text_field_tag :user, :username %>
<% end %>
<!-- generates: -->
<div class="field user_form" id="my_field">
  <input type="text" name="user[username]" id="user_username">
</div>
```



### BoxOfTricks#actions

``` rhtml
<%= actions id: "my_actions", class: "user_form" do %>
  <%= submit_tag("Save") %>
<% end %>
<!-- generates: -->
<div class="actions user_form" id="my_actions">
  <input type="submit" value="Save" id="user_submit">
</div>
```

### BoxOfTricks#div

``` rhtml
<%= div id: "some_div", class: "vague_class" do %>
  <%= link_to("Click here", "#") %>
<% end %>
<!-- generates: -->
<div id="some_div" class="vague_class">
  <a href="#">Click here</a>
</div>
```