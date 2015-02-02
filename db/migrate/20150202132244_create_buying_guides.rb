class CreateBuyingGuides < ActiveRecord::Migration
  def change
    create_table :buying_guides do |t|
      t.string :title
      t.text :description
      t.attachment :image	
      t.timestamps
    end
  end
end
