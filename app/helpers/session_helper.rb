module SessionHelper

  def current_user=(user)
    @current_user = user
  end

  def current_user
    user_id = User.encrypt(cookies[:user_id])
    @current_user ||= User.find_by(user_id: user_id)
  end
end