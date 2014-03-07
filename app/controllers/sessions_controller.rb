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
      if @user.goal
        redirect_to root_url # TODO: redirect to the last page the user was on!
      else
        redirect_to new_goal_url
      end
    else
      flash.now[:errors] = ["Invalid login credentials. Please try again!"]
      render :new
    end
  end

  def destroy
    current_user.try(:reset_session_token!)
    
    if current_user && current_user.is_demo
      current_user.destroy
    end
    
    session[:session_token] = nil    
    redirect_to new_session_url
  end
end
