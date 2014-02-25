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

  def complete
    @feed_item = current_user.feed_items.new
    @feed_item.feed_update_id = params[:id]
    @feed_item.feed_update_type = "DailyEntry"
    @feed_item.body = "completed a food diary for #{Date.today}"

    if @feed_item.save
      flash[:notices] = ["Entry marked as complete!"]
    else
      flash[:errors] = @feed_item.errors.full_messages
    end

    redirect_to diary_user_url(current_user)
  end
end
