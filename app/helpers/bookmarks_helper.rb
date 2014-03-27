
require 'uri'

module BookmarksHelper
  
  def format_date(date)
    date.to_s.split('UTC')[0].strip!
  end
  
  def favicon_tag(site_id)
    "<img class='favicon-img' src='#{root_path + 'favicons/' + Site.find(site_id).favicon}' />".html_safe
  end
  
  def bookmark_host(site_id) 
    host = Site.find(site_id).host
    "<a href='http://#{host}' target='_blank'>#{host}</a>".html_safe
  end
  
end
