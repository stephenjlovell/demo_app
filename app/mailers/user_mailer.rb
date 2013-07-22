class UserMailer < ActionMailer::Base
  default from: "Do_not_reply@example.com"

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password reset for your Sample App account"
  end

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Welcome to the Sample App!"
  end
end
