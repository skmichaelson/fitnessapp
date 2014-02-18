class GoalsController < ApplicationController
  before_filter :require_logged_in

  def new
    @goal = current_user.build_goal
  end
end

