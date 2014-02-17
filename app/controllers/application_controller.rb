class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def required_logged_in
    # TODO set the last page to memory?
    redirect_to new_session_url unless current_user
  end

end
