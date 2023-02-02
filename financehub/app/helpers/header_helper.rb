module HeaderHelper
    def new_category_helper
        user_signed_in? ? new_category_path : new_user_session_path
    end

    def all_categories_helper
        user_signed_in? ? categories_path : new_user_session_path
    end

    def new_operation_helper
        user_signed_in? ? new_operation_path : new_user_session_path
    end

    def all_operations_helper
        user_signed_in? ? operations_path : new_user_session_path
    end
end