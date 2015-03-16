class AddWidthAndHeightInCategories < ActiveRecord::Migration
  def change
    add_column :categories, :width, :integer
    add_column :categories, :height, :integer
  end
end
