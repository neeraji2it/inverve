class Product < ActiveRecord::Base
   has_many :images, :dependent => :destroy
   has_many :line_items, :dependent => :destroy
   belongs_to :category
   has_many :product_colors, :dependent => :destroy
   validates :name, :description, :price, :category_id, presence: true 
   validates :price, :numericality => {:only_float => true}
   accepts_nested_attributes_for :images, reject_if: :all_blank, :allow_destroy => true
   scope :featured, lambda {where("is_featured=?", true)}

  def self.search(search)
    if search.present?
     where('name LIKE ? ',"#{search}")
    else
      all
    end
  end
  
  def self.searching(id, search)
    if search.present?
     where("category_id = ? and name LIKE ?", id, "#{search}")
    else
     where("category_id = ?", id)
    end
  end
    

   def discount_price
     self.discount.present? ? (self.price - ((self.price * discount)/ 100.ceil)) : self.price
   end
end