
require 'nokogiri'

class Resource < ActiveRecord::Base
  
  # Extract a pages title from the HTML stuff. Use the url as title if none is available. 
  def self.scrap_title(url)
    title = url
    begin
      # scrap the web page's title
      page = Nokogiri::HTML(open(url))
      title = page.xpath('//head/title').children[0].content
      
      # remove whitespace
      title = title.squish
      # shorten if needed
      title = title[0..100].gsub(/\s\w+\s*$/, '...')
      
    rescue
      # just catch the exception
    end
    
    title
  end
  
end
