class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
 
   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      Category.all
    end
  end
end