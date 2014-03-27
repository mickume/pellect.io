class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  #def gravatar_image_url(user, size)
  #  gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
  #  "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  #end
  
end
