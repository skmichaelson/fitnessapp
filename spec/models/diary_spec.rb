require 'spec_helper'

describe Diary do
  describe "associations" do
    it { should belong_to(:user) }
  end
end
