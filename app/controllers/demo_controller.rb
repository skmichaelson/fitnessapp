class DemoController < ApplicationController
  include DemoHelper
  
  def new_user
    @user = create_demo_user
    render 'users/new'
  end
end
