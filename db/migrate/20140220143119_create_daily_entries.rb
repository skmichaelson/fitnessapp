class CreateDailyEntries < ActiveRecord::Migration
  def change
    create_table :daily_entries do |t|
      t.date :entry_date
      t.integer :calories_consumed
      t.integer :calories_burned
      t.integer :fat_intake
      t.integer :carbohydrate_intake
      t.integer :protein_intake
      t.integer :calcium_intake
      t.integer :iron_intake
      t.integer :vitamin_a_intake
      t.integer :vitamin_c_intake
      t.integer :diary_id

      t.timestamps
    end

    add_index :daily_entries, :diary_id
  end
end
