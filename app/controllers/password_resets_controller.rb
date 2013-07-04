class PasswordResetsController < ApplicationController
  
  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.send_password_reset_email
      redirect_to signin_path, notice: "Email with password reset instructions sent."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_time > 2.hours.ago 
      redirect_to new_password_reset_path, alert: "Password reset link has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to signin_path, notice: "Password has been reset."
    else
      render 'edit'
    end
  end

end
