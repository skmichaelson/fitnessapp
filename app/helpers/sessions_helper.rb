module SessionsHelper

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

end
