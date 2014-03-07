class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id, :status

  belongs_to :friend, class_name: "User", foreign_key: :friend_id
  has_many :feed_items, as: :owner

  validates :user_id, uniqueness: { scope: :friend_id, message: "Already friends with this user!" }
  
  after_save :remove_pending_request
  
  private
  
  def remove_pending_request
    req = User.find(self.user_id).friend_requests.where("friend_id = ?", self.friend_id).first
    req ? req.destroy : true
  end

end
