require 'spec_helper'

describe Diary do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:daily_entries) }
  end
end
