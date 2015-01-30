class RenameCategoryIdToSubCategoryIdInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :category_id, :sub_category_id
  end
end
