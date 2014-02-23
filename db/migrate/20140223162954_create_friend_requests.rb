class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    
    add_index :friend_requests, :user_id
  end
end
