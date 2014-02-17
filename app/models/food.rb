class Food < ActiveRecord::Base
  attr_accessible :name,
                  :calories,
                  :usda_id,
                  :protein,
                  :fat,
                  :carbohydrates,
                  :fiber,
                  :calcium,
                  :iron,
                  :potassium,
                  :sodium,
                  :vitamin_c,
                  :vitamin_a,
                  :vitamin_e,
                  :saturated_fat,
                  :cholesterol,
                  :common_weight_1,
                  :common_serving_1,
                  :common_weight_2,
                  :common_serving_2

  before_validation :ensure_default_values
  validates :name, presence: true, uniqueness: true
  validates :calories, :protein, :fat, :carbohydrates, :usda_id, presence: true

  private

  def ensure_default_values
    self.fiber ||= 0
    self.calcium ||= 0
    self.iron ||= 0
    self.potassium ||= 0
    self.sodium ||= 0
    self.vitamin_c ||= 0
    self.vitamin_a ||= 0
    self.vitamin_e ||= 0
    self.saturated_fat ||= 0
    self.cholesterol ||= 0
  end
end