class SubCategory < ActiveRecord::Base
	belongs_to :category
  belongs_to :parent_sub_category
	has_many :products, :dependent => :destroy
	validates :name, :category_id, presence: true
	validates :name, :uniqueness => {:scope => :category_id}
end