class UserMailer < ActionMailer::Base
  default from: "DoNotReply@example.com"

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password Reset for your Sample App account"
  end

end
