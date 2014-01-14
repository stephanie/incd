class EmailIdea < ActionMailer::Base

  def idea(recipient, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = recipient
    @user = user
    @idea = idea
    mail(from: @user.email, to: recipient, subject: subject)
  end

end
