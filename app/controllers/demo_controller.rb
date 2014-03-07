class DemoController < ApplicationController
  include DemoHelper
  
  def new_user
    @user = create_demo_user
    flash.now[:demo] = ["<h1>Welcome, and thanks for trying my app!</h1>".html_safe, "Please choose a password to continue"]
    render 'users/new'
  end
  
  def new_goal
    @goal = create_demo_goal
    flash.now[:demo] = ["We selected a goal for you, but feel free to change it!"]
    render 'goals/new'
  end
end
