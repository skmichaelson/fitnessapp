class AddStatusToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :status, :string, null: false, default: "PENDING"
  end
end
