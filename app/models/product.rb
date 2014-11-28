class Product < ActiveRecord::Base
   has_many :images, :dependent => :destroy
   has_many :line_items
   has_many :offers
   belongs_to :category
   validates :name, :description, :price, :category, presence: true 
   validates :price, :numericality => {:only_float => true}
   accepts_nested_attributes_for :images, reject_if: :all_blank, :allow_destroy => true
  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      Product.all
    end
  end

   def discount_price
     self.discount.present? ? (self.price - ((self.price * discount)/ 100.ceil)) : self.price
   end
end


