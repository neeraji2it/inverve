class AddStatusAndUserTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :user_type, :string
  end
end
