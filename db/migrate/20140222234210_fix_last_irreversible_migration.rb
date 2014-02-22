class FixLastIrreversibleMigration < ActiveRecord::Migration

  def change
      change_column :daily_entries, :fat_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :carbohydrate_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :protein_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :calcium_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :iron_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :vitamin_a_intake, :float, :default => 0.0, :null => false
      change_column :daily_entries, :vitamin_c_intake, :float, :default => 0.0, :null => false  
  end
end
