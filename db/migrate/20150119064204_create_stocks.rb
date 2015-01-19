class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :products, :index => true
      t.integer :quantity
      t.timestamps
    end
  end
end