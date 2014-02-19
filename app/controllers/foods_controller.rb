class FoodsController < ApplicationController
  include FoodsHelper

  def index
  end

  def search
    food_name = params[:food][:name]
    @foods = Food.where("name LIKE ?", "%#{food_name}%")
    render :index
  end

  def show
    @food = Food.find(params[:id])
    @nutrition_values = calculate_by_serving(@food, serving_size, num_servings)
  end

end