class FoodsController < ApplicationController
  include FoodsHelper

  def index
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
  end

  def search
    food_name = params[:food][:name]
    @entry = params[:daily_entry_id] ? DailyEntry.find(params[:daily_entry_id]) : nil
    @foods = Food.where("name LIKE ?", "%#{food_name}%").page(params[:page])
    render :index
  end

  def show
    @food = Food.find(params[:id])
    @entry = params[:entry] ? DailyEntry.find(params[:entry]) : nil
    @nutrition_values = calculate_by_serving(@food, serving_size, num_servings)
  end

end