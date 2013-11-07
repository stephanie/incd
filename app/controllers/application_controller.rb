class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :is_authenticated?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  protected 

  def is_authenticated?
    redirect_to signin_url unless current_user
  end

end