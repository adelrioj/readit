class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  def ensure_login
    return true if logged_in?
    session[:return_to] = request.fullpath
    # A filter that returns false halts the processing of any subsequent
    # filters and exits the current controller method
    redirect_to new_session_path and return false
  end

  protected

  def current_user
    return unless session[:user_id]
    @current_user = User.where(id: session[:user_id]).first
  end

  def logged_in?
    !@current_user.nil?
  end
  # regular helpers are available only to views, and controller methods are
  # available only to controllers. helper_method makes regular
  # controller methods available to views as if they were regular helper methods
  helper_method :logged_in?
end
