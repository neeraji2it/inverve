class Admin::OrdersController < ApplicationController
  before_filter :authenticate_admin!
	def index
	end

	def guest_orders
	end
	
	def user_orders
		
	end

end