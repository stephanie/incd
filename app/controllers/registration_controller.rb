class RegistrationController < ApplicationController
  skip_before_action :is_authenticated?

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      if session[:user_id]
        @guest_user = User.find(session[:user_id])
        # Transferring ideas from guest_user to new user created
        @guest_user.ideas.each do |idea|
          idea.user_id = @user.id
          idea.save
        end
      end

      session[:user_id] = @user.id
      # UserMailer.signedup_email(@user, request).deliver
      flash.now[:notice] = "Thank you for signing up!"
      redirect_to ideas_url
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :new
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
