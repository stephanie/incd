class UsersController < ApplicationController
  skip_before_action :is_authenticated?

  def create
    @user = User.new_guest
    if @user.save(validate: false)
      session[:user_id] = @user.id
      redirect_to ideas_url
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :new
    end
  end
end
