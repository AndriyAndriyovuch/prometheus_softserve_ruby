module CategoriesHelper
  def submit_category_type
    current_page?(new_category_path) ? t('categories.form.create') : t('categories.form.update')
  end
end
