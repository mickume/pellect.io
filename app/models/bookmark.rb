
require 'nokogiri'
require 'open-uri'

class Bookmark < ActiveRecord::Base
  
  # relations
  belongs_to :user
  has_one :resource
  
  # hooks
  before_create :initialize_bookmark
  
  self.per_page = 15
  
  def self.create_or_retrieve(params)

    # check if the url is already known
    rsrc = Resource.find_by_url params[:url]
    if rsrc
      # check for a dupilcate within the user's list of bookmarks
      bookmark = Bookmark.find_by_resource_id_and_user_id rsrc.id, params[:user_id]
      
      if bookmark.nil?
        bookmark = Bookmark.create_bookmark params
      end
      
    else
      # resource does not exist, so the bookmark can't exist
      bookmark = Bookmark.create_bookmark params
    end
    
    bookmark 
  end

  def self.create_bookmark(params)
    # normalize the url first
    url = params[:url]
    url = "http://" + url if url.index("http").nil?
    
    # scrap the site's favicon
    host = URI(url).host
    site = Site.find_by_host(host)
    
    if site.nil? 
      file = Site.scrap_favicon host
      if file
        # create a new resource record
        site = Site.new
        site.host = host
        site.favicon = file
        site.save
      else
        # load the default favicon
        site = Site.find_by_host('default')
      end
    end
    
    # retrieve / create a resource
    rsrc = Resource.find_by_url url
    if rsrc.nil?
      rsrc = Resource.new
      rsrc.url = url
      rsrc.title = Resource.scrap_title url
      rsrc.site_id = site.id
      rsrc.save!
    end
    
    # create a new bookmark
    bookmark = Bookmark.new
    
    # complete the bookmark record
    bookmark.user_id = params[:user_id]
    bookmark.view_count = 0
    bookmark.url_shortened = Bookmark.generate_short_url(url, params[:user_id]) 
    bookmark.url_shortened_pub = Bookmark.generate_public_short_url(url, params[:user_id])
    bookmark.description = params[:description]
    bookmark.description = rsrc.title if bookmark.description.nil?
    
    # add the site_id to the bookmark
    bookmark.site_id = site.id
    
    # add the resource id to the bookmark
    bookmark.resource_id = rsrc.id
    
    # save the new bookmark
    bookmark.save!
    bookmark
  end
  
    
  # Generate a (private) shortened link from a url
  def self.generate_short_url(orig_url, user_id=nil)
       
    # generate a new random key
    begin
      unique_key = self.generate_random_string(8)
    end while Bookmark.find_by_url_shortened unique_key
    
    return unique_key
    
  end
  
  # Generate a (public) shortened link from a url
  def self.generate_public_short_url(orig_url, user_id=nil)
     
    # generate a new random key
    begin
      unique_key = self.generate_random_string(8)
    end while Bookmark.find_by_url_shortened_pub unique_key
    
    return unique_key
    
  end
  
  # Generate a random string
  def self.generate_random_string(size = 8)
    # not doing uppercase as url is case insensitive
    charset = ('a'..'z').to_a + (0..9).to_a
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
  
  protected 
  
  def initialize_bookmark
    
  end
end
