class FeedItem < ActiveRecord::Base
  attr_accessible :body, :owner_id, :owner_type

  belongs_to :owner, polymorphic: true

end
