class Friendship < ActiveRecord::Base
  include FriendshipsHelper
  
  attr_accessible :user_id, :friend_id, :status

  belongs_to :friend, class_name: "User", foreign_key: :friend_id
  has_many :feed_items, as: :owner

  validates :user_id, uniqueness: { scope: :friend_id, message: "Already friends with this user!" }
  
  after_save :remove_pending_request
  after_save :send_greeting
  
  private
  
  def remove_pending_request
    req = User.find(self.user_id).friend_requests.where("friend_id = ?", self.friend_id).first
    req ? req.destroy : true
  end
  
  def send_greeting
    Message.create(recipient_id: self.user_id, 
                   sender_id: self.friend_id, 
                   subject: new_friend_subject_line, 
                   body: new_friend_message_body(User.find(friend_id)))
  end

end
