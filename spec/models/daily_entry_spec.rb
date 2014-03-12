require 'spec_helper'

describe DailyEntry do

  describe "associations" do
    it { should belong_to(:diary) }
    it { should have_many(:meal_entries) }
    it { should have_many(:foods) }
    it { should have_many(:feed_items) }
    it { should have_many(:report_items) }
  end

  describe "default values" do
    it "should set defaults" do
      new_entry = DailyEntry.new
      expect(new_entry).to have(0).errors_on(:calories_consumed)
      expect(new_entry).to have(0).errors_on(:calories_burned)
      expect(new_entry).to have(0).errors_on(:fat_intake)
      expect(new_entry).to have(0).errors_on(:carbohydrate_intake)
      expect(new_entry).to have(0).errors_on(:protein_intake)
      expect(new_entry).to have(0).errors_on(:calcium_intake)
      expect(new_entry).to have(0).errors_on(:iron_intake)
      expect(new_entry).to have(0).errors_on(:vitamin_a_intake)
      expect(new_entry).to have(0).errors_on(:vitamin_c_intake)
    end
  end
end
