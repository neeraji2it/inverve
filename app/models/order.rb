class Order < ActiveRecord::Base
	belongs_to :cart
  belongs_to :user
  validates :first_name,:last_name,:address,:landmark,:city,:pincode,:state,presence: true
  scope :guest_orders, lambda {where(:user_type => "Guest")}
  scope :user_orders, lambda {where(:user_type => "User")}
end