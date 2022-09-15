class UsersController < ApplicationController

  before_action :find_user_id, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update] # the user is only allowed to do these actions to their own profiles 
  before_action :require_same_user, only: [:edit, :update, :destroy] # the same user thats logged in can do these actions to their own profiles
  include SessionsHelper

  def index
    @users = User.paginate(page: params[:page], per_page: 5)

  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)

  end

  def new 
   @user = User.new
  end

  def edit
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      log_in @user
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you are successfully signed up"
      redirect_to articles_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update 
    if @user.update(user_params)
      flash[:notice] = "Account info updated"
      redirect_to @user 
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account & all articles related, have been deleted"
      redirect_to articles_path
    end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user_id
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

end