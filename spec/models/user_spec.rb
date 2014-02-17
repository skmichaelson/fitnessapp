require 'spec_helper'

describe User do
  context "missing vital properties" do
    let(:invalid_user) {User.new}

    it "validates presence of vital info" do
      expect(invalid_user).to have(1).error_on(:username)
      expect(invalid_user).to have(1).error_on(:password_digest)
      expect(invalid_user).to have(1).error_on(:email)
      expect(invalid_user).to have(1).error_on(:current_wt)
      expect(invalid_user).to have(1).error_on(:goal_wt)
      expect(invalid_user).to have(1).error_on(:height)
      expect(invalid_user).to have(1).error_on(:activity_level)
      expect(invalid_user).to have(1).error_on(:birthday)
      expect(invalid_user).to have(2).error_on(:gender)
    end

    it "checks for uniqueness on username and email" do
      user1 = User.create!({username: "user",
        password: "password",
        email: "user1@example.com",
        current_wt: 150,
        gender: "F",
        goal_wt: 130,
        height: 62,
        activity_level: 1,
        birthday: 19850107
        })

      user2 = User.new({username: "user",
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
        email: "user1@example.com",
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
      user1 = User.create!({username: "user",
        password: "password",
        email: "user1@example.com",
        current_wt: 150,
        gender: "F",
        goal_wt: 130,
        height: 62,
        activity_level: 1,
        birthday: 19850107
        })

      expect(user1.session_token).not_to be_nil
    end

  end
end
