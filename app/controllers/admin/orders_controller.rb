class Admin::OrdersController < ApplicationController
  before_filter :authenticate_admin!
	def index
	end

	def guest_orders
    @orders = Order.guest_orders.paginate(:page => params[:page], :per_page => 20).order("created_at DESC ")
	end
	
	def user_orders
		@orders = Order.user_orders.paginate(:page => params[:page], :per_page => 20).order("created_at DESC ")
	end

end