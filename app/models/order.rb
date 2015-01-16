class Order < ActiveRecord::Base
	belongs_to :cart
  belongs_to :user
  validates :first_name,:last_name,:address,:landmark,:city,:pincode,:state,presence: true
  scope :guest_orders, lambda {where(:user_type => "Guest")}
  scope :user_orders, lambda {where(:user_type => "User")}
  
  def self.order_count(s_date)
    Order.where("date(created_at)=?", s_date).count
  end
end