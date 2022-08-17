class UsersController < ApplicationController

  def new 
   @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you are successfully signed up"
      redirect_to articles_path
    else 
      render :new, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end