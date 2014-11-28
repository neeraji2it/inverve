class Image < ActiveRecord::Base
	belongs_to :product
	has_attached_file :avatar, :styles => { :small => "500x500", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
	
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end