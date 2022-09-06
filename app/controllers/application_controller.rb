class ApplicationController < ActionController::Base
    
  helper_method :current_user, :logged_in?, :require_user
  #returns the current logged-in user (if any)
  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id:session[:user_id]) 
    else
      @current_user
    end
      # of we can do @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
