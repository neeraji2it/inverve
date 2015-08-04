class AddCatIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :cat_id, :integer
  end
end
