class Color < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :product_colors, :dependent => :destroy
end