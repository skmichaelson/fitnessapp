class DailyEntriesController < ApplicationController
  def edit
    @entry = DailyEntry.find(params[:id])
  end

  def search
    @date = params[:entry][:date]
    @entry = current_user.daily_entries.includes(:meal_entries).where("entry_date = ?", params[:entry][:date]).first
    @user = current_user
    @diary = current_user.diaries.first
    if @entry
      @meal_entries = @entry.meal_entries
    end
    render :show
  end
end
