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

end
