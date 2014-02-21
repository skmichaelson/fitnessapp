class UsersController < ApplicationController
  before_filter :require_logged_in, only: [:index, :show, :update, :destroy, :find]

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
    @user = current_user
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
    @friends = User.find(params[:id]).friends
  end

end
