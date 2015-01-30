class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
  has_many :sub_categories, :dependent => :destroy
 
   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end