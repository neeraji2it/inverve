class RemoveParentSubCategoryIdFromSubCategories < ActiveRecord::Migration
  def change
    remove_column :sub_categories, :parent_sub_category_id, :integer
  end
end
