class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.string :body
      t.references :owner, polymorphic: true
      t.timestamps
    end
  end
end
