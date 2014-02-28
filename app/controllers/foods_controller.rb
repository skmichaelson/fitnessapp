class FoodsController < ApplicationController
  include FoodsHelper

  before_filter :require_logged_in, only: [:new, :create]

  def index
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
  end

  def search
    food_name = params[:food][:name]
    if food_name.strip.empty? || food_name.length < 2
      @foods = []
      flash.now[:errors] = ["Please enter a valid search string!"]
    end
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
    @foods ||= Food.where("name LIKE ?", "%#{food_name}%").page(params[:page])
    render :index
  end

  def show
    @food = Food.find(params[:id])
    @entry = params[:entry] ? DailyEntry.find(params[:entry]) : nil
    @nutrition_values = calculate_by_serving(@food, serving_size, num_servings)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])

    if params[:serving][:size].empty? || params[:serving][:size] == 0
      flash.now[:errors] = ["Please enter a serving size!"]
      render new
      return
    end

    if @food.valid?
      multiplier = 100 / (params[:serving][:size].to_f * params[:serving][:unit].to_f)
      @food.calories *= multiplier
      @food.save
      flash[:notices] = "#{@food.name} successfully added to the database!"
      redirect_to food_url(@food)
    else
      flash.now[:errors] = @food.errors.full_messages
      render new
    end
  end

end