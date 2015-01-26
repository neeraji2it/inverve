class AddColorIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :color_id, :integer
  end
end
