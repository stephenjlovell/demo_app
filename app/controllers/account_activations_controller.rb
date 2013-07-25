class AccountActivationsController < ApplicationController
  def show
    @user = User.find_by_account_activation_token!(params[:id])
    @user.activate_user 
    if @user && @user.save
      flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to @user
    else
      flash[:notice] = "account activation invalid"
      render 'new'
    end
  end
end
