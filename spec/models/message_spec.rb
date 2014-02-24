require 'spec_helper'

describe Message do
  describe "assocations" do
    it { should belong_to(:recipient) }
    it { should belong_to(:sender) }
  end
end
