class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.integer :bmr, null: false
      t.integer :calorie_goal, null: false
      t.integer :fat_ratio, null: false
      t.integer :carb_ratio, null: false
      t.integer :protein_ratio, null: false
      t.integer :sodium, null: false
      t.integer :potassium, null: false
      t.integer :cholesterol, null: false
      t.integer :calcium, null: false
      t.integer :vitamin_a, null: false
      t.integer :vitamin_c, null: false
      t.integer :iron, null: false
      t.integer :workouts_per_week, null: false
      t.integer :minutes_per_workout, null: false
      t.integer :weight_loss_rate, null: false

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
