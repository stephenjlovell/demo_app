class UserMailer < ActionMailer::Base
  default from: Figaro.env.gmail_username

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password Reset for your Sample App account"
  end

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Welcome to the Sample App!"
  end

end
