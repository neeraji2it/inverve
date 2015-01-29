class Banner < ActiveRecord::Base
	has_attached_file :image, :styles => {:original => "1000x400>",:default => "226x287!",:thumb => "96x96>"} 
	validates_attachment_content_type :image,
	:content_type => [ 'image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp', 'image/x-png', 'image/pjpeg' ]
	
	validates_attachment_size(:image, :less_than => 10.megabytes)
	validates :image_description, :small_description, :image, :presence => true
end