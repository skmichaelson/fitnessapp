module DemoHelper
  
  def create_demo_user
    User.new(username: "demouser",
             email: "demouser@example.com",
             password: "password",
             birthday: Date.new(1990, 1, 1),
             city: "Lafayette",
             state: "IN",
             zipcode: 47901,
             current_wt: 150,
             goal_wt: 140,
             height: 64,
             activity_level: 1,
             gender: "F",
             is_demo: true)
  end
  
  def create_demo_goal
    current_user.build_goal(workouts_per_week: 3, minutes_per_workout: 30, weight_loss_rate: 10)
  end
end
