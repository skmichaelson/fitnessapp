class DailyEntry < ActiveRecord::Base
  attr_accessible :entry_date,
    :calories_consumed,
    :calories_burned,
    :fat_intake,
    :carbohydrate_intake,
    :protein_intake,
    :calcium_intake,
    :iron_intake,
    :vitamin_a_intake,
    :vitamin_c_intake,
    :diary_id

  belongs_to :diary
  has_many :meal_entries, dependent: :destroy
  has_many :foods, through: :meal_entries, source: :food
end
