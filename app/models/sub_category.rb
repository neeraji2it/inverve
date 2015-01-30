class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :products, :dependent => :destroy
	validates :name, :category_id, presence: true
	validates :name, :uniqueness => {:scope => :category_id}
end