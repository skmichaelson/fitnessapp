class RecreateFeedItemsTable < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.text :body
      t.integer :user_id, null: false
      t.references :feed_update, polymorphic: true

      t.timestamps
    end

    add_index :feed_items, :user_id
  end
end
