class UserMailer < ActionMailer::Base
  default from: "inc'd <admin@incd.com>"
  
  def reset_email(user, request)
    @user = user
    @host = request.protocol + request.host_with_port
    
    mail to: @user.email, subject: "inc'd: Reset your credentials"
  end
  
  def signedup_email(user, request)
    @user = user
    @host = request.protocol + request.host_with_port
    
    mail to: @user.email, subject: "inc'd: Thank you for signing up!"
  end
end