class UsersController < ApplicationController
  before_filter :require_logged_in, only: [:index, :show, :update, :destroy, :find, :reports]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.save
      session[:session_token] = @user.session_token
      redirect_to new_goal_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.includes(:friends).includes(:friend_requests).includes(:pending_friends).page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notices] = ["Profile updated!"]
    else
      flash[:errors] = @user.errors.full_messages
    end

    render :edit
  end

  def goals
    render 'goals/show'
  end

  def diary
    @user = User.includes(:goal).find(params[:id])
    @diary = @user.diaries.first
    @diary ||= @user.diaries.create
    @entry = @diary.daily_entries.where("entry_date = ?", Date.today).first
    @entry ||= @diary.daily_entries.create(entry_date: Date.today)
    @meal_entries = @entry.meal_entries
    @foods = @entry.foods
    render 'diary/show'
  end

  def friends
    @friends = User.includes(:friendships).find(params[:id]).friends
    @user = User.includes(:pending_friends).find(current_user)
  end

  def home
    if current_user
      @user = User.includes(:friends).includes(:goal).includes(:daily_entries).find(current_user)
      @daily_entry = @user.daily_entries.where("entry_date = ?", Date.today).first
      @goal = @user.goal
      @calories_remaining = (@daily_entry && @goal) ? @goal.calorie_goal - @daily_entry.calories_consumed : @goal.calorie_goal
      @feed_items = @user.friend_feed_items
    end
  end

  def reports
    @report = current_user.report
    if @report.report_items.empty?
    else
      reportable_type = @report.report_items.first.reportable_type
      @tracked_attr = reportable_type == "WeighIn" ? "current_wt" : "calories_consumed"
    end
  end
end
