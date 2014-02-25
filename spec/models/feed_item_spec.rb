require 'spec_helper'

describe FeedItem do
  describe "associations" do
    it { should belong_to(:user) }
  end
end
