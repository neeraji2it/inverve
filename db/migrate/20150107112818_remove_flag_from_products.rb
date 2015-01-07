class RemoveFlagFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :flag, :boolean
  end
end
