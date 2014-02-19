class FoodsController < ApplicationController
  def index
  end

  def search
    food_name = params[:food][:name]
    @foods = Food.where("food.name LIKE %?%", food_name)
  end
end
