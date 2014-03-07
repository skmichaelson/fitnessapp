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
      if current_user.is_demo
        flash[:demo] = ["Nice work! You food diary has been updated, and your remaining calories have been calculated."]
        flash[:demo] << "Feel free to add more entries, but if you're done, click 'Complete this entry.'"
      end
      redirect_to diary_user_url(current_user)
    else
      flash[:errors] = @meal.errors.full_messages
      render :show
    end
  end
end
