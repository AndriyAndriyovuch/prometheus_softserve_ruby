module OperationsHelper
    def format_description(operation)
        if current_page?(operations_path) 
            truncate operation.description, length: 20
        else
            operation.description
        end
    end


    def show_operation_type(operation)
        if params[:o_type] == nil
            operation.income? ? t('operations.income') : t('operations.outlay')
        end
    end
    
    def category_title(category_type)
        case category_type

        when 'income' then t('operations.income') + ' operations'
        when 'outlay' then t('operations.outlay') + ' operations'
        else t('header.operations.title')

        end
    end
end