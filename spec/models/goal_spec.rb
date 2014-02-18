require 'spec_helper'

describe Goal do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:bmr) }
  it { should validate_presence_of(:calorie_goal) }
  it { should validate_presence_of(:fat_ratio) }
  it { should validate_presence_of(:carb_ratio) }
  it { should validate_presence_of(:protein_ratio) }
  it { should validate_presence_of(:sodium) }
  it { should validate_presence_of(:potassium) }
  it { should validate_presence_of(:cholesterol) }
  it { should validate_presence_of(:calcium) }
  it { should validate_presence_of(:vitamin_a) }
  it { should validate_presence_of(:vitamin_c) }
  it { should validate_presence_of(:iron) }
  it { should validate_presence_of(:workouts_per_week) }
  it { should validate_presence_of(:mintues_per_workout) }
  it { should validate_presence_of(:weight_loss_rate) }

  context "setting defaults" do
    let(:new_goal) {
      Goal.create(user_id: 1,
        bmr: 1500,
        calorie_goal: 1600,
        workouts_per_week: 3,
        minutes_per_workout: 30,
        weight_loss_rate: 1)
    }

    it "has the correct default values" do
      expect(new_goal.fat_ratio).to eq(30)
      expect(new_goal.carb_ratio).to eq(55)
      expect(new_goal.protein_ratio).to eq(15)
      expect(new_goal.sodium).to eq(2500)
      expect(new_goal.potassium).to eq(3500)
      expect(new_goal.cholesterol).to eq(300)
      expect(new_goal.calcium).to eq(100)
      expect(new_goal.vitamin_a).to eq(100)
      expect(new_goal.vitamin_c).to eq(100)
    end

  end

  context "autogenerating values" do
    let(:new_goal) {
      Goal.new(user_id: 1,
        workouts_per_week: 3,
        minutes_per_workout: 30,
        weight_loss_rate: 1,
        user_gender: "F",
        user_age: 30,
        user_height: 62,
        user_weight: 130,
        activity_level: 1)
    }
    before { new_goal.save }

    it "should assign iron based on gender" do
      new_goal.update_attributes(user_gender: "F")
      expect(new_goal.iron).to eq(18)

      new_goal.update_attributes(user_gender: "M")
      expect(new_goal.iron).to eq(8)
    end

    it "should calculate BMR to the nearest integer" do
      expect(new_goal.bmr).to eq(1371)
    end

    it "should calculate calorie goal" do
      expect(new_goal.calorie_goal).to eq(1385)
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
