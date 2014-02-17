class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :session_token
      t.text :about_me
      t.text :my_inspiration
      t.integer :current_wt
      t.integer :goal_wt
      t.integer :height
      t.integer :activity_level
      t.date :birthday

      t.timestamps
    end
  end
end
