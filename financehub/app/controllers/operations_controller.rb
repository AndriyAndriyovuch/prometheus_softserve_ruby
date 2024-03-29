class OperationsController < ApplicationController
  before_action :check_signed_in
  before_action :set_operation, only: %i[show edit update destroy]

  def index
    @operations = Operation.where(user_id: current_user.id).order('odate DESC').page params[:page]
    check_params_present
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = current_user.operations.build(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: 'Operation was successfully created.' }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: 'Operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: 'Operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:amount, :odate, :description, :category_id, :income)
  end

  def check_signed_in
    redirect_to new_user_session_path unless signed_in?
  end

  def check_params_present
    @operations = @operations.where(income: params[:income]) if params[:income].present?
    @operations = @operations.where(category_id: params[:category]) if params[:category].present?

    @operations
  end
end
