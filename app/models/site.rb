
require 'uri'
require 'open-uri'

class Site < ActiveRecord::Base
  
  #relations
  #belongs_to :bookmark
  
  @path = "public/favicons/"
  
  # Scrap the site's favicon and store it for reference. Returns the filename of the favicon.
  def self.scrap_favicon(host)
    file = host.downcase.gsub('.','') + ".png"
    file_and_path = @path + file
    
    begin
      open(file_and_path, 'wb') do |f|
        f << open("http://www.google.com/s2/favicons?domain=#{host}").read
      end
    rescue
      file = nil
    end
    
    file
  end
  
end
