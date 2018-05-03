class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    @roles = Role.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
  def lock
    authorize! :lock, @user, :message => 'Not authorized as an administrator.'
    
    user = User.find(params[:id])
    user.blocked = true
    user.save!
    
    redirect_to :controller => 'users', :action => 'index'
    
  end
  
  def unlock
    authorize! :unlock, @user, :message => 'Not authorized as an administrator.'
    
    user = User.find(params[:id])
    user.blocked = false
    user.save!
    
    redirect_to :controller => 'users', :action => 'index'
    
  end
  
  def destroy
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end