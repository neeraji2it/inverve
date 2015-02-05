class AddProductSizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_size, :string
  end
end
