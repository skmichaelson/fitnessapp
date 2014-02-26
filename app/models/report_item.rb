class ReportItem < ActiveRecord::Base
  attr_accessible :user_id, :reportable_id, :reportable_type

  belongs_to :user
  belongs_to :reportable, polymorphic: true
  has_and_belongs_to_many :reports

  validates :user_id, :reportable_id, :reportable_type, presence: true
end
