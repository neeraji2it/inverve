class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end