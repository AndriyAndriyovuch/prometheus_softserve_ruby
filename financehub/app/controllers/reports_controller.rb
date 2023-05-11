class ReportsController < ApplicationController
  before_action :check_signed_in
  before_action :select_operations, only: %i[report_by_category report_by_dates]
  before_action :check_income, only: %i[report_by_category report_by_dates]

  def index
  end

  def report_by_dates
  end

  def report_by_category
    @categories_outlay = {}
    @operations_outlay.map { |oper| @categories_outlay[oper.category.name] = 0.0 }
    @operations_outlay.map { |oper| @categories_outlay[oper.category.name] += oper.amount.to_f }

    @categories_income = {}
    if @operations_income.length.positive?
      @operations_income.map { |oper| @categories_income[oper.category.name] = 0.0 }
      @operations_income.map { |oper| @categories_income[oper.category.name] += oper.amount.to_f }
    end

    # Just for fun, makes random colors in chart
    @background_colors = []
    (@categories_income.length + @categories_outlay.length).times do
      @background_colors.append("rgb(#{rand 255}, #{rand 255}, #{rand 255})")
    end
  end

  private

  def select_operations
    @operations = current_user.operations
                              .filter_by_start_date(params[:start_date])
                              .filter_by_final_date(params[:final_date])
                              .order(:odate)

    @operations = @operations.filter_by_category_id(params[:category_id]) if params[:category_id].present?
  end

  def check_income
    @operations_outlay = @operations.where(income: false)
    @operations_outlay_data = Hash[@operations_outlay.map { |oper| [oper.odate.strftime('%Y-%m-%d'), 0] }]

    @operations_outlay.all.map { |oper|
      @operations_outlay_data[oper.odate.strftime('%Y-%m-%d')] += oper.amount.to_f.round(2)
    }

    if params[:income] == 'true'
      @operations_income = @operations.where(income: true)
      @operations_income_data = Hash[@operations_income.map { |oper| [oper.odate.strftime('%Y-%m-%d'), 0] }]

      @operations_income.all.map { |oper|
        @operations_income_data[oper.odate.strftime('%Y-%m-%d')] += oper.amount.to_f.round(2)
      }
    else
      @operations_income = []
      @operations_income_data = {}
    end

    @operations_outlay_dates = @operations_outlay.all.map { |o| o.odate.strftime('%Y-%m-%d') }.uniq

    return if @operations_income_data.empty?

    @operations_income_dates = @operations_income.all.map { |o| o.odate.strftime('%Y-%m-%d') }.uniq
  end

  def check_signed_in
    redirect_to new_user_session_path unless signed_in?
  end
end
