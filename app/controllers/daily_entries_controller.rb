class DailyEntriesController < ApplicationController
  def edit
    @entry = DailyEntry.find(params[:id])
    @meal_entry = @entry.meal_entries.new(meal_id: params[:meal_id])
  end
end
