class DailyEntriesController < ApplicationController
  def edit
    @entry = DailyEntry.find(params[:id])
  end
end
