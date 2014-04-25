class BackgroundTasksController < ApplicationController
  
  def age_bookmarks
    Thread.new do
      
      bookmarks = Bookmark.where(:archived => false)
      bookmarks.each do |b|
        b.time_to_expiration = b.time_to_expiration - 1
        b.save!
      end
      
    end
    
    head :ok, :content_type => 'text/html'
  end
  
  def expire_bookmarks
    Thread.new do
      
      bookmarks = Bookmark.where("time_to_expiration < 0")
      bookmarks.each do |b|
        b.destroy!
      end
      
    end
    
    head :ok, :content_type => 'text/html'
  end
  
end
