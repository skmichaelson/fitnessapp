class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end

end
