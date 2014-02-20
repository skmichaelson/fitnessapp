class MealEntry < ActiveRecord::Base
  attr_accessible :food_id, :daily_entry_id, :meal_id, :quantity

  validates :food, :daily_entry, presence: true
  validates :meal_id, :quantity, presence: true

  belongs_to :food
  belongs_to :daily_entry

end
