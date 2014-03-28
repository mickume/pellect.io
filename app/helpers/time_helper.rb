
#
# see http://brandonhilkert.com/blog/relative-timestamps-in-rails/
#
# add the following .js snippet to pages / layouts where the timeago helper is used:
#
#<%= javascript_tag do %>
#  $(function() {
#    $("time.timeago").timeago();
#  });
#<% end %>
   
module TimeHelper
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(datetime: time.getutc.iso8601)) if time
  end
end