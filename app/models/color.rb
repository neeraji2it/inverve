class Color < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  belongs_to :image
end