class CreateWeighIns < ActiveRecord::Migration
  def change
    create_table :weigh_ins do |t|
      t.integer  "user_id", null: false
      t.integer  "current_wt", null: false
      t.integer  "previous_wt", null: false

      t.timestamps
    end

    add_index :weigh_ins, :user_id
  end
end
