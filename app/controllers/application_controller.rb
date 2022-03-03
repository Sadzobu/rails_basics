class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  private

  def authenticate_user!
    save_path and redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def save_path
    session[:return_to] = request.fullpath
  end
end
