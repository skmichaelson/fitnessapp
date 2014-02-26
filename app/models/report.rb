class Report < ActiveRecord::Base
  attr_accessible :user_id

  has_and_belongs_to_many :report_items
end
