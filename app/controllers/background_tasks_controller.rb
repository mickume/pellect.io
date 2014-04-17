class BackgroundTasksController < ApplicationController
  
  def age_bookmarks
    Thread.new do
      # use a SQL statement !!!!!
      
      bookmarks = Bookmark.all
      bookmarks.each do |b|
        b.time_to_expiration = b.time_to_expiration - 1
        b.save!
      end
      
    end
    
    head :ok, :content_type => 'text/html'
  end
  
  def expire_bookmarks
    Thread.new do
      # use a SQL statement !!!!!
      
      bookmarks = Bookmark.where("time_to_expiration < #{Figaro.env.url_expires.to_i}")
      bookmarks.each do |b|
        b.destroy!
      end
      
    end
    
    head :ok, :content_type => 'text/html'
  end
  
end
