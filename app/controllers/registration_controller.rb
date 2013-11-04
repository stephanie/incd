class RegistrationController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
    session[:user_id] = @user.id
    # UserMailer.signedup_email(@user, request).deliver
    flash.now[:notice] = "Thank you for signing up!"
    redirect_to root_url
    else
    flash.now[:error] = "Something went wrong. Please try again."
    render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
