/** @jsx React.DOM */
var <%= file_name.camelize %> = React.createClass({
<% if attributes.size > 0 %>
  propTypes: {
<% attributes.each_with_index do |attribute, idx| -%>
    <%= attribute[:name].camelize(:lower) %>: React.PropTypes.<%= attribute[:type] %><% if (idx < attributes.length-1) %>,<% end %>
<% end -%>
  },
<% end %>

  render: function() {
    return <div />;
  }
})
