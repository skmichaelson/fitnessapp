class Goal < ActiveRecord::Base
  ACTIVITY_MULTIPLIERS = {
    0 => 1.2,
    1 => 1.375,
    2 => 1.725,
    3 => 1.9
  }

  attr_accessible :user_id,
                  :bmr,
                  :calorie_goal,
                  :fat_ratio,
                  :carb_ratio,
                  :protein_ratio,
                  :sodium,
                  :potassium,
                  :cholesterol,
                  :calcium,
                  :vitamin_a,
                  :vitamin_c,
                  :iron,
                  :workouts_per_week,
                  :minutes_per_workout,
                  :weight_loss_rate

  before_validation :ensure_default_values
  before_create :assign_calculated_values

  validates :fat_ratio, :carb_ratio, :protein_ratio, presence: true
  validates :sodium, :potassium, presence: true
  validates :calcium, :cholesterol, presence: true
  validates :vitamin_a, :vitamin_c, presence: true
  validates :workouts_per_week, :minutes_per_workout, presence: true
  validates :user, presence: true

  belongs_to :user, inverse_of: :goal

  def calculate_bmr
    if self.user.gender == "F"
      bmr = (4.7 * self.user.height) +
        (4.35 * self.user.current_wt) -
        (4.7 * self.user.age) +
        655
    else
      bmr = (12.7 * self.user.height) +
        (6.23 * self.user.current_wt) -
        (6.8 * self.user.age) +
        66
    end

    bmr.round
  end

  def calculate_calorie_goal
    daily_burn = self.calculate_bmr * ACTIVITY_MULTIPLIERS[self.user.activity_level]
    deficit = (self.weight_loss_rate * 350) / 7

    (daily_burn - deficit).round
  end

  private

  def ensure_default_values
    self.fat_ratio ||= 30
    self.carb_ratio ||= 55
    self.protein_ratio ||= 15
    self.sodium ||= 2500
    self.potassium ||= 3500
    self.cholesterol ||= 300
    self.calcium ||= 100
    self.vitamin_a ||= 100
    self.vitamin_c ||= 100
    self.iron ||= self.user.gender == "F" ? 18 : 8
  end

  def assign_calculated_values
    self.bmr = calculate_bmr
    self.calorie_goal = calculate_calorie_goal
  end

end