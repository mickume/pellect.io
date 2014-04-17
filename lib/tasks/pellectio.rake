namespace :pellectio do
  desc "TODO"
  task expiration_setup: :environment do
    bookmarks = Bookmark.all
    
    now = DateTime.now.to_date
    ttl = Figaro.env.url_ttl.to_i
    
    bookmarks.each do |b|
    
      created = b.created_at.to_date
      age = (now - created).to_i
      expires_in = ttl - age
      
      b.time_to_expiration = expires_in
      b.save!
      
      puts "+++ ID=#{b.id} CREATED=#{b.created_at.to_date} - AGE=#{age} - EXPIRES IN=#{expires_in}"
      
    end
    
  end

end
