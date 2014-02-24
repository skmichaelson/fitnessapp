class FeedItemsController < ApplicationController
  def create
    @feed_item_1 = FeedItem.new(owner_id: params[:daily_entry_id], owner_type: params[:owner_type], body: params[:body])
    @feed_item_2 = current_user.feed_items.new(body: params[:body])

    if @feed_item_1.save && @feed_item_2.save
      flash[:notices] = ["Published!"]
      redirect_to root_url
    else
    end
  end
end
