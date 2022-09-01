class ApplicationController < ActionController::Base
    
  helper_method :current_user, :logged_in?
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
end
