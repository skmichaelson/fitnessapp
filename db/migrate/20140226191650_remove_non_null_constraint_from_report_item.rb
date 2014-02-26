class RemoveNonNullConstraintFromReportItem < ActiveRecord::Migration

  def change
    change_column :report_items, :report_id, :integer
  end
end
