class AddShippingAddressInfosToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :same_as_billing, :boolean
    add_column :orders, :city1, :string
    add_column :orders, :state1, :string
    add_column :orders, :country1, :string
    add_column :orders, :address1, :text
    add_column :orders, :landmark1, :text
    add_column :orders, :phone1, :string
    add_column :orders, :pincode1, :string
  end
end