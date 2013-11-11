class SessionController < ApplicationController
  # skip_before_action :is_authenticated?
  before_action :is_authenticated?, only: [ :destroy ]
  
  def new
    redirect_to ideas_url if current_user
  end
  
  def create
     username = params[:user][:username]
     password = params[:user][:password]

     if user = User.authenticate(username, password)
       session[:user_id] = user.id
       
       redirect_to ideas_url
     else
       flash.now[:error] = "Unable to sign you in. Please try again."
       render :new
     end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've logged out."
  end

end

