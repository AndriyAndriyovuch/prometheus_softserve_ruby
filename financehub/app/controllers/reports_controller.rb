class ReportsController < ApplicationController
  before_action :check_category_id_exists, only: %i[report_by_category report_by_dates]

  def index
  end

  def report_by_dates
    @operations_data = @operations.all.map { |operation| [operation.odate.strftime("%F"), operation.amount] }

    @operations_date = @operations_data.map { | operation | operation[0] }
    @operations_amount = @operations_data.map { | operation| operation[1] }

    render "report_by_dates"
  end

  def report_by_category
    #add hash for representable it in html
    @categories = {}
    Category.all.map { |cat| @categories[cat.name] = 0.0 }

    #add amount to each category
    @operations.each do | operation |
      current_category = Category.find(operation.category_id).name
      @categories[current_category] += operation.amount.to_f
    end

    @categories_title = @categories.map { |cat | cat[0]}
    @categories_sum = @categories.map { |cat | cat[1].round(2)}

    @background_colors = []
    @categories.length.times do
      @background_colors.append("rgb(#{rand 255}, #{rand 255}, #{rand 255})")
    end

    render "report_by_category"
  end

  private

  def check_category_id_exists
    if params[:category_id] == ""
      @operations = Operation.order(:odate).filter_by_start_date(params[:start_date])
                             .filter_by_final_date(params[:final_date])
    else
      @operations = Operation.order(:odate).filter_by_start_date(params[:start_date])
                             .filter_by_final_date(params[:final_date])
                             .filter_by_category_id(params[:category_id])
    end
  end
end
