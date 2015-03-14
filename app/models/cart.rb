class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	has_one :order, :dependent => :destroy
	def total_price
    line_items.to_a.sum(&:full_price)
  end

end

