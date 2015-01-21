class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.string :first_name
      t.string :last_name
      #here
      t.text :address
      t.text :landmark
      t.string :pincode
      t.string :city
      t.string :state
      t.string :country
      t.text :phone
      #here
      t.string :ip_address
      
      t.integer :card_num
      t.string :card_type
      t.date :card_expires_on
      t.integer :card_cvv
      t.timestamps
    end
  end
end
