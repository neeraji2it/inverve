class RemoveImageFromCategories < ActiveRecord::Migration
  def change
  	remove_attachment :categories, :avatar
  	remove_column :categories, :height
  	remove_column :categories, :width
  end
end
