require 'spec_helper'

describe CheckIn do
  describe "associations" do
    it { should belong_to :user }
  end
end
