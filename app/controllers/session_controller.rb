class SessionController < ApplicationController
  before_action :is_authenticated?, only: [ :destroy ]
  
  def new
    redirect_to root_url if current_user
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to register_url
  end

end

