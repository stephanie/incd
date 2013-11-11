class PasswordController < ApplicationController
  before_action :get_user

  def create
    email = params[:user][:email]

    if user = User.find_by(email: email)
      flash.now[:notice] = PasswordReset.new(request).send_password_reset(user)
    else
      flash.now[:notice] = UserRegistration.new(request).send_email_verification(email)
    end
    
    render :new
  end

    def edit
    end
    
    def update
      PasswordReset.new(request).reset_password(@user, params)
      
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Your password has been updated."
      else
        flash.now[:error] = @user.errors
        render :edit
      end
    end
    
  private
  
  def get_user
    unless @user = User.find_by_code(params[:code])
      redirect_to login_url, error: "Sorry, your code has expired. Please try again."
    end
  end
end

