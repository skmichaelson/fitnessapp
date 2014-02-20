class AddIndexOnDatetoDailyEntries < ActiveRecord::Migration
  def change
    add_index :daily_entries, :entry_date
  end
end
