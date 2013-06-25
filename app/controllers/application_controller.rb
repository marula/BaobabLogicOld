class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_admin

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_admin
    @current_user_admin ||= User.find(session[:user_id]).admin if session[:user_id]
  end

  def store_location
    session[:return_to] ||= request.fullpath
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to log_in_path
      return false
    end
  end

  def require_admin
    if !current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to log_in_path
      return false
    elsif !current_user.admin
      store_location
      flash[:notice] = "You must have admin rights to access this page"
      redirect_to root_path
      return false            
    end
  end
end
