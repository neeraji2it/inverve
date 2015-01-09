class Order < ActiveRecord::Base
	belongs_to :cart
  belongs_to :user
  validates :first_name,:last_name,:address,:landmark,:city,:pincode,:state,presence: true
end