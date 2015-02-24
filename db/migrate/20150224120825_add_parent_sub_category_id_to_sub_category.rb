class AddParentSubCategoryIdToSubCategory < ActiveRecord::Migration
  def change
    add_column :sub_categories, :parent_sub_category_id, :integer
  end
end
