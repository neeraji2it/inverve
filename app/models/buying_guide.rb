class BuyingGuide < ActiveRecord::Base
  validates :title, :description, :image, :presence => true
  validates :title, :uniqueness => true
  
  has_attached_file :image, :styles => { :thumb => "700x460", :small => "80x80"}, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end