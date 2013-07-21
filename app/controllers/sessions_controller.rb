class SessionsController < ApplicationController
  
  def new
  end

  def create  
    user = User.find_by_email(params[:email].downcase)
    
    if user && user.authenticate(params[:password]) && user.active?
      sign_in user
      redirect_back_or user
    elsif user && !user.active?
      flash.now[:error] = 'Please activate your account via the welcome email before logging in.'
      render 'new' 
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_url, notice: "logged out successfully."
  end
end
