class UsersController < ApplicationController
  before_filter :require_logged_in, only: [:show, :update, :destroy, :find]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.save
      session[:session_token] = @user.session_token
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
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
    @diary = User.find(params[:id]).diaries.first
    @entry = @diary.daily_entries.where("entry_date = ?", Date.today).first
    @entry ||= @diary.daily_entries.create(entry_date: Date.today)
    render 'diary/show'
  end

end
