class DropColors < ActiveRecord::Migration
  def change
    drop_table :colors
  end
end
