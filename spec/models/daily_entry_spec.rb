require 'spec_helper'

describe DailyEntry do

  describe "associations" do
    it { should belong_to(:diary) }
    it { should have_many(:meal_entries) }
  end
end
