class SessionsController < ApplicationController
  include SessionsHelper
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    userIdentifier = params[:user][:identifier]
    password = params[:user][:password]
    @user = User.find_by_credentials(userIdentifier, password)

    if @user
      login_user!(@user)
      set_user_age(@user)
      redirect_to root_url # TODO: redirect to the last page the user was on!
    else
      flash.now[:errors] = ["Invalid login credentials. Please try again!"]
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    current_user.try(:reset_session_token!)
    redirect_to new_session_url
  end
end
