module CategoriesHelper
  def submit_category_type
    if current_page?(new_category_path)
      t('categories.form.create')
    elsif current_page?(edit_category_path)
      t('categories.form.update')
    end
  end
end
