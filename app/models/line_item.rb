class LineItem < ActiveRecord::Base
  
	 belongs_to :cart
   belongs_to :product  

  def full_price
    unit_price * quantity
  end
   
   def discount   	
    (full_price * discount)/ 100.ceil
   end
end