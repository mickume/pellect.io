
class EmailProcessor
  def self.process(email)
    
    status = 200
    
    begin
      # user lookup
      user = User.find_by_email email.from
    
      if user
        urls = EmailProcessor.extract_urls email.body
        
        if urls != []
          # assumes that the first url (if any) is the one to scrap
          bookmark_params = { :url => urls[0], :description => email.subject, :user_id => user.id }
          bookmark = Bookmark.create_or_retrieve bookmark_params
        end
      else
        status = 406
      end
    rescue
      status = 500
    end
    
    status
  end
  
  def self.extract_urls(body)
    urls = []
    
    lines = body.split("\n")
    lines.each do |line|
      url = URI.extract line
      if url != []
        url.each do |u|
          urls << u
        end
      end
    end
    
    urls  
  end
  
end