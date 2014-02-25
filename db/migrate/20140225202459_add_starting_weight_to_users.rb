class AddStartingWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :starting_wt, :integer, null: false, default: 0
  end
end
