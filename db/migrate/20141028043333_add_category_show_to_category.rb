class AddCategoryShowToCategory < ActiveRecord::Migration
  def change
  	add_column :categories, :category_show, :boolean, :default => true
  end
end

