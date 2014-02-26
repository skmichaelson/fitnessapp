class CreateReportItems < ActiveRecord::Migration
  def change
    create_table :report_items do |t|
      t.integer :report_id, null: false
      t.references :reportable, polymorphic: true

      t.timestamps
    end

    add_index :report_items, :report_id
  end
end
