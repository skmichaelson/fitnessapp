class AddDemoColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_demo, :boolean, null: false, default: false
  end
end
