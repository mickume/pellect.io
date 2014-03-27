
require 'email_processor'

#
# configure Griddler 
#
Griddler.configure do |config|
  config.processor_class = EmailProcessor # MyEmailProcessor
  config.to = :hash # :full, :email, :token
  config.from = :email # :full, :token, :hash
  config.reply_delimiter = '-- REPLY ABOVE THIS LINE --'
  if ENV["RAILS_ENV"] == 'development'
    config.email_service = :simplemail
  else
    config.email_service = :mailgun
  end
end