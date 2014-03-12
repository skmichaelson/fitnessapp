# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    name Faker::Commerce.product_name
    calories Math.send(:rand, 400)
    usda_id Math.send(:rand, 999) + 20000
    protein Math.send(:rand, 30)
    fat Math.send(:rand, 30)
    carbohydrates Math.send(:rand, 30)
  end
end