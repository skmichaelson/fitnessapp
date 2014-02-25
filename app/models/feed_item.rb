class FeedItem < ActiveRecord::Base
  attr_accessible :body, :feed_update_id, :feed_update_type, :user_id

  belongs_to :user
  belongs_to :feed_update, polymorphic: true

end
