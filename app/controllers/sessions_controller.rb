class SessionsController < ApplicationController
include SessionsHelper
  
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # session[:user_id] = user.id
      #used a helper method in helper folder to create this help to call anywhere if needed
      log_in user
      flash.now[:notice] = "Loggin Successful"
      redirect_to user
    else 
      flash.now[:alert] = "Wrong Username or Password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to root_path
  end
end