class ReportsController < ApplicationController

  def index
  end

  def report_by_category
    check_category_id_exists
    render "report_by_category"
  end

  def report_by_dates
    check_category_id_exists
    render "report_by_dates"
  end

  private
  def check_category_id_exists
    puts params
    if params[:category_id] == ''
      @operations = Operation.filter_by_start_date(params[:start_date])
                             .filter_by_final_date(params[:final_date])
    else
      @operations = Operation.filter_by_category_id(params[:category_id])
                             .filter_by_start_date(params[:start_date])
                             .filter_by_final_date(params[:final_date])
    end
  end

end
