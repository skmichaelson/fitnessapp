require 'spec_helper'

describe MealEntry do
  describe "associations" do
    it { should belong_to(:daily_entry) }
    it { should belong_to(:food) }
  end
end
