class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'follow_list'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'follow_list'
  end

  def index  # restrict @users to results of search
    @users = User.search(params[:search]).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @feed_items = @user.feed.paginate(page: params[:page])
  end
  
  def new
    if signed_in?
      redirect_to root_path
    else
    	@user = User.new
    end
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
      if @user.save
        UserMailer.welcome(@user).deliver
        flash[:success] = "Account activation email sent. Just click the link in the email to get started."
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user? @user
      flash[:notice] = "Administrators cannot delete their own profiles via the web interface." 
    else
      @user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user? @user
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
