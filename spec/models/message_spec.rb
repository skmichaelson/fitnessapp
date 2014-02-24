require 'spec_helper'

describe Message do
  describe "assocations" do
    it { should belong_to(:recepient) }
    it { should belong_to(:sender) }
  end
end
