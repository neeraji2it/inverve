class Color < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_one :image
end