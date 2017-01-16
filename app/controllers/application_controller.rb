class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
        user = User.find(session[:user_id])
    end

  def require_login
    redirect_to new_session_path if session[:user_id].nil?
  end
end
