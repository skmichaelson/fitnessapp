class DropReportIdFromReportItem < ActiveRecord::Migration
  def change
    remove_column :report_items, :report_id
  end
end
