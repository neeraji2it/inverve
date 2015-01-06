class AddCodToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :cod, :integer
  end
end
