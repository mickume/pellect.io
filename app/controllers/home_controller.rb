class HomeController < ApplicationController
  
  def index
    if user_signed_in?
      redirect_to :controller => 'internal', :action => 'index'
    end
  end
  
end
