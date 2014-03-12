require 'spec_helper'

describe Goal do
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:bmr) }
  it { should allow_mass_assignment_of(:calorie_goal) }
  it { should allow_mass_assignment_of(:fat_ratio) }
  it { should allow_mass_assignment_of(:carb_ratio) }
  it { should allow_mass_assignment_of(:protein_ratio) }
  it { should allow_mass_assignment_of(:sodium) }
  it { should allow_mass_assignment_of(:potassium) }
  it { should allow_mass_assignment_of(:cholesterol) }
  it { should allow_mass_assignment_of(:calcium) }
  it { should allow_mass_assignment_of(:vitamin_a) }
  it { should allow_mass_assignment_of(:vitamin_c) }
  it { should allow_mass_assignment_of(:iron) }
  it { should allow_mass_assignment_of(:workouts_per_week) }
  it { should allow_mass_assignment_of(:minutes_per_workout) }
  it { should allow_mass_assignment_of(:weight_loss_rate) }

  describe "associations" do
    it { should belong_to(:user) }
  end
end
