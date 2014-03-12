class ReportsController < ApplicationController
  before_filter :require_logged_in

  def index
    redirect_to new_user_report_url(current_user)
  end

  def show
  end

  def create
    @report = current_user.build_report
    date_range = params[:report][:time].to_i.days.ago..Time.now
    report_items = current_user.report_items
                               .where(updated_at:      date_range,
                                      reportable_type: params[:report][:type])
    if report_items.empty?
      flash[:errors] = ["No data available during this timeframe!"]
    else
      flash[:notices] = ["Report created!"]
    end

    @report.report_items = report_items
    @report.save

    redirect_to reports_user_url(current_user, reportable: params[:report][:type])
  end

end
