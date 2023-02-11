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
            operation.income? ? "Income" : "Oulay"
        end
    end
    
    def category_title(category_type)
        case category_type

        when 'income' then "Income operations"
        when 'outlay' then "Outlay operations"
        else "Operations"

        end
    end
end