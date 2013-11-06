class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    redirect_to signin_url unless current_user
  end

  def current_user_ideas
    @current_user_ideas = Idea.find(:all, :conditions => {:user_id => session[:user_id]})
  end

end
