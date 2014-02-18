require 'spec_helper'

describe Goal do

  context "setting defaults" do
    let(:new_goal) {
      Goal.create(user_id: 1,
        bmr: 1500,
        calorie_goal: 1600,
        workouts_per_week: 3,
        minutes_per_workout: 30,
        user_gender: "F",
        user_age: 30,
        user_height: 62,
        user_weight: 130,
        activity_level: 1,
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
    new_goal = Goal.new(user_id: 1,
        workouts_per_week: 3,
        minutes_per_workout: 30,
        weight_loss_rate: 5,
        user_gender: "F",
        user_age: 30,
        user_height: 62,
        user_weight: 130,
        activity_level: 1)

    it "should calculate BMR to the nearest integer" do
      new_goal.save
      expect(new_goal.bmr).to eq(1371)
    end

    it "should calculate calorie goal" do
      new_goal.save
      expect(new_goal.calorie_goal).to eq(1635)
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
