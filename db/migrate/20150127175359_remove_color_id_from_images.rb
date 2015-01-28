class RemoveColorIdFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :color_id, :integer
  end
end
