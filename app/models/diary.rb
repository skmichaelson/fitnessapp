class Diary < ActiveRecord::Base
  attr_accessible :meal0, :meal1, :meal2, :meal3, :meal4, :meal5, :user_id

  belongs_to :user
  has_many :daily_entries

  validates :user, presence: :true
end
