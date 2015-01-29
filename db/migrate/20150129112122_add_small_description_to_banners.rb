class AddSmallDescriptionToBanners < ActiveRecord::Migration
  def change
  	add_column :banners, :small_description, :text
  end
end
