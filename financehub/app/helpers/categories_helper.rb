module CategoriesHelper
  def submit_category_type
    current_page?(new_category_path) ? t('categories.form.create') : t('categories.form.update')
  end

  def categories_list
    current_user.categories.map { |cat| [cat.name, cat.id] }
  end
end
