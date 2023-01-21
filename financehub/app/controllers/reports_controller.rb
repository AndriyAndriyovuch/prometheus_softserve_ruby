class ReportsController < ApplicationController

  def index
  end

  def report_by_category
    # puts '______________________'
    # puts params
    # puts '______________________'
    @operations = Operation.filter_by_category_id(params[:category_id]).filter_by_start_date(params[:start_date]).filter_by_final_date(params[:final_date])
    # puts "============================="
    # p @operations
    # puts "============================="
    render "report_by_category"
  end

  def report_by_dates
    render "report_by_dates"
  end

end
