class MealEntry < ActiveRecord::Base
  include MealEntriesHelper

  attr_accessible :food_id, :daily_entry_id, :meal_id, :quantity

  validates :food, :daily_entry, presence: true
  validates :meal_id, :quantity, presence: true
  after_save :update_daily_entry

  belongs_to :food
  belongs_to :daily_entry

  def update_daily_entry
    attributes = calculate_by_quantity(self.food, self.quantity)
    attributes.each do |attribute|
      if attribute.first == "calories"
        self.daily_entry["#{attribute.first}_consumed".to_sym] += attribute.last
      elsif attribute.first == "carbohydrates"
        self.daily_entry["carbohydrate_intake".to_sym] += attribute.last
      else
        if self.daily_entry["#{attribute.first}_intake".to_sym]
          self.daily_entry["#{attribute.first}_intake".to_sym] += attribute.last
        end
      end
    end
    self.daily_entry.save
  end

end
