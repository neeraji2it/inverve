	class Product < ActiveRecord::Base
	has_many :images, :dependent => :destroy
    has_many :line_items
	belongs_to :category
	validates :name, :description, :price, :category, presence: true 
	validates :price, :numericality => {:only_float => true}
	accepts_nested_attributes_for :images, reject_if: :all_blank, :allow_destroy => true

end

