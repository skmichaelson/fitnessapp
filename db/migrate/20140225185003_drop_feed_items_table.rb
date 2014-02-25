class DropFeedItemsTable < ActiveRecord::Migration
  def change
    drop_table :feed_items
  end
end
