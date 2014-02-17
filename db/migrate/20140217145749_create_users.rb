class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :gender, null: false
      t.string :session_token, null: false, unique: true
      t.text :about_me
      t.text :my_inspiration
      t.integer :current_wt, null: false
      t.integer :goal_wt, null: false
      t.integer :height, null: false
      t.integer :activity_level, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
