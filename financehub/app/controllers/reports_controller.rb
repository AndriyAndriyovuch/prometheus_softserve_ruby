class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    @operations = Operation.find(params[:category_id])
    render "report_by_category"
  end

  def report_by_dates
    render "report_by_dates"
  end
end
