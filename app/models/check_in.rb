class CheckIn < ActiveRecord::Base
  attr_accessible :user_id, :current_wt

  belongs_to :user
  has_many :feed_items, as: :feed_update
end
