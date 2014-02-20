class AddNonNullConstraintsToDailyEntries < ActiveRecord::Migration
  def change
    change_column :daily_entries, :calories_consumed, :integer, null: false, default: 0
    change_column :daily_entries, :calories_burned, :integer, null: false, default: 0
    change_column :daily_entries, :fat_intake, :integer, null: false, default: 0
    change_column :daily_entries, :carbohydrate_intake, :integer, null: false, default: 0
    change_column :daily_entries, :protein_intake, :integer, null: false, default: 0
    change_column :daily_entries, :calcium_intake, :integer, null: false, default: 0
    change_column :daily_entries, :iron_intake, :integer, null: false, default: 0
    change_column :daily_entries, :vitamin_a_intake, :integer, null: false, default: 0
    change_column :daily_entries, :vitamin_c_intake, :integer, null: false, default: 0
  end
end
