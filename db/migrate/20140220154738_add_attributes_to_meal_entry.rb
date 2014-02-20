class AddAttributesToMealEntry < ActiveRecord::Migration
  def change
    add_column :meal_entries, :meal_id, :integer, null: false
    add_column :meal_entries, :quantity, :float, null: false
    add_index :meal_entries, :meal_id
  end
end
