class Message < ActiveRecord::Base
  attr_accessible :subject, :body, :sender_id, :recipient_id

  belongs_to :recepient, class_name: "User", foreign_key: :recipient_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
end
