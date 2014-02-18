require 'spec_helper'

describe User do

  let(:user1) {
    User.create!({username: "randomuser",
      password: "password",
      email: "randomuser@example.com",
      current_wt: 150,
      gender: "F",
      goal_wt: 130,
      height: 62,
      activity_level: 1,
      birthday: 19850107
      })
    }

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
    expect(e[:current_wt]).to include("Please enter your current weight")
  end

  it "checks for uniqueness on username and email" do
    User.create!({username: "randomuser",
      password: "password",
      email: "randomuser@example.com",
      current_wt: 150,
      gender: "F",
      goal_wt: 130,
      height: 62,
      activity_level: 1,
      birthday: 19850107
    })

    user2 = User.new({username: "randomuser",
      password: "password",
      email: "user2@example.com",
      current_wt: 150,
      gender: "F",
      goal_wt: 130,
      height: 62,
      activity_level: 1,
      birthday: 19850107
      })

    user3 = User.new({username: "user",
      password: "password",
      email: "randomuser@example.com",
      current_wt: 150,
      gender: "F",
      goal_wt: 130,
      height: 62,
      activity_level: 1,
      birthday: 19850107
      })

        expect(user2).not_to be_valid
        expect(user3).not_to be_valid
    end

  it "assigns a session token upon creation of a user" do
      expect(user1.session_token).not_to be_nil
  end

  describe "associations" do
    it { should have_one(:goal) }
  end

end
