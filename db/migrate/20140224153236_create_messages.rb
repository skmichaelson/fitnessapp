class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient_id, null: false
      t.integer :sender_id, null: false
      t.string :subject
      t.text :body

      t.timestamps
    end

    add_index :messages, :recipient_id
    add_index :messages, :sender_id
  end
end
