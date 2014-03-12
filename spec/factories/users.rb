# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password "password"
    email { Faker::Internet.email }
    starting_wt (100 + Math.send(:rand, 100))
    goal_wt (100 + Math.send(:rand, 100))
    height (24 + Math.send(:rand, 76))
    activity_level Math.send(:rand, 4)
    birthday Date.new((1930 + Math.send(:rand, 70)), (Math.send(:rand, 11) + 1), (Math.send(:rand, 27) + 1))
    gender (Math.send(:rand, 3) < 1 ? "M" : "F")
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
  end
end