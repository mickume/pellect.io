class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :blocked_user?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def blocked_user?
    if !current_user.nil?
      if current_user.blocked?
        sign_out current_user
        redirect_to root_path, :notice => "Your account has been blocked - Please contact us for details"
      end
    end
  end
  
end
