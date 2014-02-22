class ChangeDailyEntriesToFloats < ActiveRecord::Migration
  def change
      change_column :daily_entries, :fat_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :carbohydrate_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :protein_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :calcium_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :iron_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :vitamin_a_intake, :integer, :default => 0.0, :null => false
      change_column :daily_entries, :vitamin_c_intake, :integer, :default => 0.0, :null => false  
  end
end
