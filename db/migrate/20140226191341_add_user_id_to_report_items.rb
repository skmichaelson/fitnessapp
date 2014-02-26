class AddUserIdToReportItems < ActiveRecord::Migration
  def change
    add_column :report_items, :user_id, :integer
  end
end
