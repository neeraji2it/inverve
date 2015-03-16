class Order < ActiveRecord::Base
	belongs_to :cart
  belongs_to :user
  validates :first_name,:last_name,:address,:landmark,:city,:pincode,:state,:phone, presence: true
  scope :guest_orders, lambda {where(:user_type => "Guest")}
  scope :user_orders, lambda {where(:user_type => "User")}
  
  def self.order_count(s_date)
    Order.where("date(created_at)=?", s_date).count
  end

 # if(params[:order][:same_as_billing] == "0" || params[:order][:first_name] == "" )
 #     @order.errors.add(:same_as_billing, "Required field")
  #end

   def billing_validation
   	if(self.same_as_billing == "0" || self.first_name == "" )
      errors.add(:same_as_billing, "Required field")
    end
   end

end