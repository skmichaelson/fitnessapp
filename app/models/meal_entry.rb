class MealEntry < ActiveRecord::Base
  attr_accessible :food_id, :daily_entry_id

  belongs_to :food
  belongs_to :daily_entry
end
