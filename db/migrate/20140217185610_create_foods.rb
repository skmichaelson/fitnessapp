class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :usda_id, null: false, default: 0
      t.integer :calories, null: false, default: 0
      t.float :protein, null: false, default: 0
      t.float :fat, null: false, default: 0
      t.float :carbohydrates, null: false, default: 0
      t.float :fiber, null: false, default: 0
      t.integer :calcium, default: 0
      t.float :iron, default: 0
      t.integer :potassium, default: 0
      t.integer :sodium, default: 0
      t.float :vitamin_c, default: 0
      t.integer :vitamin_a, default: 0
      t.integer :vitamin_e, default: 0
      t.float :saturated_fat, default: 0
      t.integer :cholesterol, default: 0
      t.float :common_weight_1, default: 0
      t.string :common_serving_1, default: 0
      t.float :common_weight_2, default: 0
      t.string :common_serving_2, default: 0

      t.timestamps
    end
  end
end
