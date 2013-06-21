class SessionsController < ApplicationController
  
  def new
    # render signin page for creating new session
  end

  def create  
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # end session and delete cookie.
  end

end
