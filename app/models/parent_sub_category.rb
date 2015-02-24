class ParentSubCategory < ActiveRecord::Base
 belongs_to :category
has_many :sub_categories,:dependent => :destroy
end
