class CreateParentSubCategories < ActiveRecord::Migration
  def change
    create_table :parent_sub_categories do |t|
      t.string :name
      t.integer :category_id
      t.timestamps
    end
  end
end
