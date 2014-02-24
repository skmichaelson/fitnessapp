class FriendRequest < ActiveRecord::Base
  attr_accessible :user_id, :friend_id
  
  belongs_to :user
  belongs_to :friend, class_name: "User"
  
  validates :user_id, uniqueness: { scope: :friend_id, message: "request is pending" }
end
