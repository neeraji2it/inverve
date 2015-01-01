class AddFlagToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :flag, :boolean,:default => true
  end
end

