require 'spec_helper'

describe User do
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:goal_wt) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:activity_level) }
  it { should validate_presence_of(:birthday) }
  it { should validate_presence_of(:gender) }

  it "should have custom error messages" do
    invalid_user = User.create
    e = invalid_user.errors.messages
    expect(e[:username]).to include("Please choose a username")
  end

  it "checks for uniqueness on username and email" do
    first_user = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user, username: first_user.username)
    expect(user2).to have(1).error_on(:username)

    user3 = FactoryGirl.build(:user, email: first_user.email)
    expect(user3).to have(1).error_on(:email)
  end

  describe "associations" do
    it { should have_one(:goal) }
    it { should have_one(:report) }
    it { should have_many(:diaries) }
    it { should have_many(:received_messages) }
    it { should have_many(:sent_messages) }
    it { should have_many(:daily_entries) }
    it { should have_many(:friendships) }
    it { should have_many(:friends) }
    it { should have_many(:friend_requests) }
    it { should have_many(:feed_items) }
    it { should have_many(:report_items) }
    it { should have_many(:weigh_ins) }
    it { should have_many(:friend_feed_items) }
  end

  describe "callbacks" do
    let(:user1) { FactoryGirl.create(:user) }

    it "should calculate the user's age" do
      expect(user1.age).not_to be_nil
    end

    it "should assign a session token" do
      expect(user1.session_token).not_to be_nil
    end

    it "should create a food diary" do
      expect(user1.diaries).not_to be_empty
    end

    it "should set the user's current weight to the starting weight" do
      expect(user1.current_wt).to eq(user1.starting_wt)
    end
  end

end
