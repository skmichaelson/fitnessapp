class ReportItem < ActiveRecord::Base
  attr_accessible :report_id, :reportable_id, :reportable_type

  belongs_to :report
  belongs_to :reportable, polymorphic: true
end
