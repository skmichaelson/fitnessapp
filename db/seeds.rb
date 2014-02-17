user1 = {username: "lollipopette",
  password: "password",
  email: "user1@example.com",
  current_wt: 120,
  gender: "F",
  goal_wt: 105,
  height: 61,
  activity_level: 1,
  birthday: 19850107
}

user2 = {username: "unclebobert",
  password: "password",
  email: "user2@example.com",
  current_wt: 180,
  gender: "M",
  goal_wt: 160,
  height: 71,
  activity_level: 1,
  birthday: 19850101
}

user3 = {username: "adager",
  password: "password",
  email: "user3@example.com",
  current_wt: 140,
  gender: "F",
  goal_wt: 140,
  height: 66,
  activity_level: 1,
  birthday: 19510505
}

user4 = {username: "imaki",
  password: "password",
  email: "user4@example.com",
  current_wt: 125,
  gender: "M",
  goal_wt: 135,
  height: 65,
  activity_level: 2,
  birthday: 19880416
}

user5 = {username: "abbott",
  password: "password",
  email: "user5@example.com",
  current_wt: 205,
  gender: "F",
  goal_wt: 170,
  height: 64,
  activity_level: 1,
  birthday: 19820318
}

user6 = {username: "joerock",
  password: "password",
  email: "user6@example.com",
  current_wt: 225,
  gender: "M",
  goal_wt: 190,
  height: 72,
  activity_level: 2,
  birthday: 19941026
}

user7 = {username: "chocolatewalnut",
  password: "password",
  email: "user7@example.com",
  current_wt: 165,
  gender: "F",
  goal_wt: 130,
  height: 64,
  activity_level: 1,
  birthday: 19860909
}

user8 = {username: "grandpapa",
  password: "password",
  email: "user8@example.com",
  current_wt: 180,
  gender: "M",
  goal_wt: 160,
  height: 67,
  activity_level: 0,
  birthday: 19220430
}

all_users = [user1, user2, user3, user4, user5, user6, user7, user8]

all_users.each do |user|
  User.create!(user)
end