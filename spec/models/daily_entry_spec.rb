require 'spec_helper'

describe DailyEntry do

  describe "associations" do
    it { should belong_to(:diary) }
  end
end
