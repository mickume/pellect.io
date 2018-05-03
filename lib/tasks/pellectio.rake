namespace :pellectio do
  desc "add expiration field"
  task expiration_setup: :environment do
    bookmarks = Bookmark.all
    
    now = DateTime.now.to_date
    ttl = 128
    
    bookmarks.each do |b|
    
      created = b.created_at.to_date
      age = (now - created).to_i
      expires_in = ttl - age
      
      b.time_to_expiration = expires_in
      b.save!
      
      puts "+++ ID=#{b.id} CREATED=#{b.created_at.to_date} - AGE=#{age} - EXPIRES IN=#{expires_in}"
      
    end
    
  end # expiration_setup:

  desc "add archive flag"
  task archive_setup: :environment do
    bookmarks = Bookmark.all
    
    bookmarks.each do |b|
      b.archived = false
      b.save!
    end
  end # archive_setup:
  
  desc "add expired flag"
  task expired_setup: :environment do
    bookmarks = Bookmark.all
    
    bookmarks.each do |b|
      b.expired = false
      b.save!
    end
  end # expired_setup::
  
  desc "remove whitespace from descriptions and title"
  task whitespace: :environment do
    bookmarks = Bookmark.all
    bookmarks.each do |b|
      b.description = b.description.squish
      b.description = b.description[0..50].gsub(/\s\w+\s*$/, '...')
      b.save!
    end
    
    rsrc = Resource.all
    rsrc.each do |r|
      r.title = r.title.squish
      r.title = r.title[0..50].gsub(/\s\w+\s*$/, '...')
      r.save!
    end
    
  end
  
end
