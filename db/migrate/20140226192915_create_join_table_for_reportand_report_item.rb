class CreateJoinTableForReportandReportItem < ActiveRecord::Migration
  def change
    create_table :report_items_reports do |t|
      t.belongs_to :report
      t.belongs_to :report_item
    end
  end
end
