class ReportsController < ApplicationController
  def new
  end

  def create
    @report = current_user.build_report
    date_range = params[:report][:time].to_i.days.ago..Time.now
    report_items = current_user.report_items
                               .where(updated_at:      date_range,
                                      reportable_type: params[:report][:type])
    @report.report_items = report_items
    @report.save
    redirect_to reports_user_url(current_user)
  end

end
