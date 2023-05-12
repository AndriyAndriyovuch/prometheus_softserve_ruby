module OperationsHelper
  def format_description(operation)
    current_page?(operations_path) ? (truncate operation.description, length: 30) : operation.description
  end

  def show_operation_type(operation)
    return if params[:income].present?

    operation.income? ? t('operations.income') : t('operations.outlay')
  end

  def category_title
    return t('header.operations.title') if params[:income].nil?

    params[:income] == 'true' ? t('operations.income') : t('operations.outlay')
  end

  def submit_operation_type
    current_page?(new_operation_path) ? t('operations.form.create') : t('operations.form.update')
  end
end
