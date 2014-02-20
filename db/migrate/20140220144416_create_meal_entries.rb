class CreateMealEntries < ActiveRecord::Migration
  def change
    create_table :meal_entries do |t|
      t.integer :daily_entry_id
      t.integer :food_id

      t.timestamps
    end

    add_index :meal_entries, :daily_entry_id
  end
end
