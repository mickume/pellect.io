
class CustomDeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  
  def confirmation_instructions(record, token, opts={})
    headers["Message-ID"] = generate_message_id
    super
  end
  
  def reset_password_instructions(record, token, opts={})
    headers["Message-ID"] = generate_message_id
    super
  end
  
  def unlock_instructions(record, token, opts={})
    headers["Message-ID"] = generate_message_id
    super
  end
  
  private
  
  def generate_message_id
    "<#{ UUID.generate }@#{ Rails.application.config.action_mailer.smtp_settings[:domain] }>"
  end
  
end

