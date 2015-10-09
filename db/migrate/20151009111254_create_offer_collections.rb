class CreateOfferCollections < ActiveRecord::Migration
  def change
    create_table :offer_collections do |t|
      t.text :go_text
      t.integer :go_percent
      t.integer :go_parent
      t.timestamps
    end
  end
end
