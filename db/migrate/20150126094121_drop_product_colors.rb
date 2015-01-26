class DropProductColors < ActiveRecord::Migration
  def change
    drop_table :product_colors
  end
end
