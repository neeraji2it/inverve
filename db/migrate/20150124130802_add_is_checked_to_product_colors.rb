class AddIsCheckedToProductColors < ActiveRecord::Migration
  def change
    add_column :product_colors, :is_checked, :boolean, :default => false
  end
end
