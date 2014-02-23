class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id, :status

  belongs_to :friend, class_name: "User", foreign_key: :friend_id
    
end
