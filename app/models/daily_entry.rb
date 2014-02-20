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

  validates :calories_consumed, :calories_burned, presence: true
  validates :fat_intake, :carbohydrate_intake, :protein_intake, presence: true
  validates :calcium_intake, :iron_intake, presence: true
  validates :vitamin_a_intake, :vitamin_c_intake, presence: true
  validates :diary, presence: true

  before_validation :ensure_default_values

  belongs_to :diary
  has_many :meal_entries, dependent: :destroy
  has_many :foods, through: :meal_entries, source: :food

  private

  def ensure_default_values
    self.calories_consumed ||= 0
    self.calories_burned ||= 0
    self.fat_intake ||= 0
    self.carbohydrate_intake ||= 0
    self.protein_intake ||= 0
    self.calcium_intake ||= 0
    self.iron_intake ||= 0
    self.vitamin_a_intake ||= 0
    self.vitamin_c_intake ||= 0
  end
end
