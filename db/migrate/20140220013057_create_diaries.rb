class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :meal0, default: "Breakfast"
      t.string :meal1, default: "Lunch"
      t.string :meal2, default: "Dinner"
      t.string :meal3
      t.string :meal4
      t.string :meal5
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :diaries, :user_id
  end
end
