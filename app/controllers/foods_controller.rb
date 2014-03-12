class FoodsController < ApplicationController

  before_filter :require_logged_in, only: [:new, :create]

  def index
    if current_user && current_user.is_demo
      flash[:demo] = ["We parsed the raw CSV from the USDA food database.", "Enter a search term to find a food. If you're at a loss, try searching for 'Alaska'."]
    end
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
    @meal_num = params[:meal_num]
  end

  def search
    if current_user && current_user.is_demo
      flash[:demo] = ["Click on a food to pull up more information about its nutritional values."]
    end
    food_name = params[:food][:name].downcase

    if food_name.strip.empty? || food_name.length < 2
      @foods = []
      flash.now[:errors] = ["Please enter a valid search string!"]
    end

    @meal_num = params[:meal_num]
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
    @foods ||= Food.where("name LIKE ?", "%#{food_name}%").page(params[:page])
    render :index
  end

  def show
    if current_user && current_user.is_demo
      flash[:demo] = ["How much did you eat? We'll calculate the number of calories consumed based on that serving size."]
      flash[:demo] << "You chose which meal to add the food to, but you can change it here if you made a mistake."
    end

    @food = Food.find(params[:id])
    @meal_num = params[:meal_num]
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