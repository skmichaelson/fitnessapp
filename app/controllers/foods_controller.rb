class FoodsController < ApplicationController
  def index
  end

  def search
    food_name = params[:food][:name]
    @foods = Food.where("name LIKE ?", "%#{food_name}%")
    render :index
  end

  def show
    @food = Food.find(params[:id])
    @serving_size = params[:servings] ? params[:servings][:size].to_f : 100
    @num_servings = params[:servings] ? params[:servings][:number].to_f : 1

    adjusted_nutrition_values = calculate_by_serving(@food, @serving_size, @num_servings)

    @calories = adjusted_nutrition_values["calories"]
    @fat = adjusted_nutrition_values["fat"]
    @carbohydrates = adjusted_nutrition_values["carbohydrates"]
    @protein = adjusted_nutrition_values["protein"]

    @vitamin_a = adjusted_nutrition_values["vitamin_a"]
    @vitamin_c = adjusted_nutrition_values["vitamin_c"]
    @calcium = adjusted_nutrition_values["calcium"]
    @iron = adjusted_nutrition_values["iron"]

  end

end