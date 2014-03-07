class GoalsController < ApplicationController
  before_filter :require_logged_in

  def new
    @goal = current_user.build_goal
  end

  def create
    @goal = current_user.build_goal
    @goal.update_attributes(params[:goals])

    if @goal.save
      if current_user.is_demo
        demo_message = "Click on the 'Add Friend' button to submit a friend request!"
        flash[:demo] = ["Great! We used the Harris-Benedict equation to calculate your nutrient needs."]
        flash[:demo] << "Feel free to explore on your own, but we suggest you start \
                        by <a href=#{users_url(demo_message: demo_message)}>\
                        making friends</a> with other users on this site".html_safe
      end
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @carbs = calculate_goal(@goal.carb_ratio, @goal.calorie_goal) / 4
    @protein = calculate_goal(@goal.fat_ratio, @goal.calorie_goal) / 4
    @fat = calculate_goal(@goal.fat_ratio, @goal.calorie_goal) / 9
    @updated = @goal.updated_at.strftime("%A, %B %-d, %Y")
  end

  def edit
    @goal = Goal.find(params[:id])
    unless @goal.user_id == current_user.id
      flash[:notices] = ["You can only update your own goals!"]
      redirect_to goal_url(@goal)
    end
  end
end

