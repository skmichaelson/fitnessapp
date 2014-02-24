require 'spec_helper'

describe FriendRequest do
  describe "assocations" do
    it { should belong_to(:user) }
  end
end
