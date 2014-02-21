class MealEntriesController < ApplicationController

  def new
    @daily_entry = DailyEntry.find(params[:daily_entry_id])
    @meal_entry = @daily_entry.meal_entries.new
  end

  def create
    @entry = DailyEntry.find(params[:daily_entry_id])
    @meal = @entry.meal_entries.new(food_id: params[:food][:id],
      quantity: calculate_quantity(params[:servings][:number], params[:servings][:size]),
      meal_id: params[:meal][:num])

    if @meal.save
      redirect_to diary_user_url(current_user)
    else
      flash[:errors] = @meal.errors.full_messages
      render :show
    end
  end
end
