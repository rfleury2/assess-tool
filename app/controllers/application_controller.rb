class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @_current_user ||= cookies[:auth_token] && User.find_by(auth_token: cookies[:auth_token])
  end

  def require_login
    redirect_to new_session_path unless current_user
  end
end
