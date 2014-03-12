require 'spec_helper'

describe Food do
  context "missing vital properties" do
    let(:invalid_food) { Food.new }

    it "validates presence of vital info" do
      expect(invalid_food).to have(1).error_on(:name)
      expect(invalid_food).to have(1).error_on(:calories)
      expect(invalid_food).to have(1).error_on(:protein)
      expect(invalid_food).to have(1).error_on(:fat)
      expect(invalid_food).to have(1).error_on(:carbohydrates)
    end
  end

  it "assigns defaults if they are not provided" do
    new_food = FactoryGirl.create(:food)

    expect(new_food.fiber).to eq(0)
    expect(new_food.calcium).to eq(0)
    expect(new_food.iron).to eq(0)
    expect(new_food.potassium).to eq(0)
    expect(new_food.sodium).to eq(0)
    expect(new_food.vitamin_c).to eq(0)
    expect(new_food.vitamin_a).to eq(0)
    expect(new_food.vitamin_e).to eq(0)
    expect(new_food.saturated_fat).to eq(0)
    expect(new_food.cholesterol).to eq(0)
  end

  describe "associations" do
    it { should have_many(:meal_entries) }
  end
end
