class AddFirstName1AndLastName1ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name1, :string
    add_column :orders, :last_name1, :string
  end
end
