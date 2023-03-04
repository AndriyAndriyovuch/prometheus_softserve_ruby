class OperationsController < ApplicationController
  before_action :check_signed_in
  before_action :set_operation, only: %i[show edit update destroy]

  # GET /operations or /operations.json
  def index
    case params[:o_type]
    when 'income'
      @operations = Operation.all.where('user_id = ? AND income =  true',
                                        current_user.id).order('odate DESC').page params[:page]
    when 'outlay'
      @operations = Operation.all.where('user_id = ? AND income = false',
                                        current_user.id).order('odate DESC').page params[:page]
    else
      @operations = Operation.all.where('user_id = ?', current_user.id).order('odate DESC').page params[:page]
    end
  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)
    @operation.user_id = current_user.id

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

  # PATCH/PUT /operations/1 or /operations/1.json
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

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: 'Operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:amount, :odate, :description, :category_id, :income)
  end

  def check_signed_in
    redirect_to new_user_session_path unless signed_in?
  end
end
