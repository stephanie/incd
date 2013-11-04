class PasswordController < ApplicationController
  
  def edit

    @user = User.find_by(code: params[:code])
    puts
    puts @user.inspect
    puts
    if @user && @user.expires_at > Time.now
      render :edit
    else
      redirect_to register_url, error: "Sorry, your code has expired. Please try again."
    end
  end
  
  def update
    @user = User.find_by(code: params[:code])
    
    if @user.update_attributes(user_params)
      @user.code = nil
      @user.expires_at = nil
      @user.save
      
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Your password has been updated."
    else
      flash.now[:error] = "Something went wrong. Please check and try again."
      render :edit
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation
    )
  end
end
