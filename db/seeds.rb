require 'csv'

user1 = {username: "lollipopette",
  password: "password",
  email: "user1@example.com",
  starting_wt: 120,
  gender: "F",
  goal_wt: 105,
  height: 61,
  activity_level: 1,
  birthday: Date.new(1985, 1, 7),
  age: 29
}

user2 = {username: "unclebobert",
  password: "password",
  email: "user2@example.com",
  starting_wt: 180,
  gender: "M",
  goal_wt: 160,
  height: 71,
  activity_level: 1,
  birthday: Date.new(1985, 1, 1),
  age: 29
}

user3 = {username: "adager",
  password: "password",
  email: "user3@example.com",
  starting_wt: 140,
  gender: "F",
  goal_wt: 140,
  height: 66,
  activity_level: 1,
  birthday: Date.new(1951, 5, 5),
  age: 62
}

user4 = {username: "imaki",
  password: "password",
  email: "user4@example.com",
  starting_wt: 125,
  gender: "M",
  goal_wt: 135,
  height: 65,
  activity_level: 2,
  birthday: Date.new(1988, 4, 16),
  age: 25
}

user5 = {username: "abbott",
  password: "password",
  email: "user5@example.com",
  starting_wt: 205,
  gender: "F",
  goal_wt: 170,
  height: 64,
  activity_level: 1,
  birthday: Date.new(1982, 3, 18),
  age: 31
}

user6 = {username: "joerock",
  password: "password",
  email: "user6@example.com",
  starting_wt: 225,
  gender: "M",
  goal_wt: 190,
  height: 72,
  activity_level: 2,
  birthday: Date.new(1994, 10, 26),
  age: 18
}

user7 = {username: "chocolatewalnut",
  password: "password",
  email: "user7@example.com",
  starting_wt: 165,
  gender: "F",
  goal_wt: 130,
  height: 64,
  activity_level: 1,
  birthday: Date.new(1986, 9, 9),
  age: 27
}

user8 = {username: "grandpapa",
  password: "password",
  email: "user8@example.com",
  starting_wt: 180,
  gender: "M",
  goal_wt: 160,
  height: 67,
  activity_level: 0,
  birthday: Date.new(1922, 4, 30),
  age: 91
}

all_users = [user1, user2, user3, user4, user5, user6, user7, user8]

all_users.each do |user|
  u = User.new(user)
  next unless u.save
end

def get_food_from_csv(file)
  contents = CSV.open file, headers: true, header_converters: :symbol
  info = []
  contents.each do |row|
    food_hash = {}
    food_hash[:name] = row[:name].downcase.gsub(",", ", ")
    food_hash[:calories] = row[:calories]
    food_hash[:usda_id] = row[:usda_id]
    food_hash[:protein] = row[:protein]
    food_hash[:fat] = row[:fat]
    food_hash[:carbohydrates] = row[:carbohydrates]
    food_hash[:fiber] = row[:fiber]
    food_hash[:calcium] = row[:calcium]
    food_hash[:iron] = row[:iron]
    food_hash[:potassium] = row[:potassium]
    food_hash[:sodium] = row[:sodium]
    food_hash[:vitamin_c] = row[:vitamin_c]
    food_hash[:vitamin_a] = row[:vitamin_a]
    food_hash[:vitamin_e] = row[:vitamin_e]
    food_hash[:saturated_fat] = row[:saturated_fat]
    food_hash[:cholesterol] = row[:cholesterol]
    food_hash[:common_weight_1] = row[:common_weight_1]
    food_hash[:common_serving_1] = row[:common_serving_1]
    food_hash[:common_weight_2] = row[:common_weight_2]
    food_hash[:common_serving_2] = row[:common_serving_2]
    info << food_hash
  end

  info
end

food1 = get_food_from_csv("db/dairy0217.csv")
food2 = get_food_from_csv("db/fruits0217.csv")
food3 = get_food_from_csv("db/meat0218.csv")
food4 = get_food_from_csv("db/cereal0218.csv")
food5 = get_food_from_csv("db/vegetables0226.csv")

food_list = [food1, food2, food3, food4, food5]

food_list.each do |list|
  list.each do |food|
    f = Food.new(food)
    next unless f.save
  end
end