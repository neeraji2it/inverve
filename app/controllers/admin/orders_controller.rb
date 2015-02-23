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

	def order_status
		@orders = Order.guest_orders.paginate(:page => params[:page], :per_page => 20).order("created_at DESC ")
		@order = Order.find(params[:id])
		if (params[:parm].present? && params[:parm] == "Shipped")
			@order.update_attributes(:status => "Shipped")
			flash[:notice] = "You have changed the order status to Shipped."
		elsif (params[:parm].present? && params[:parm] == "Returned")
			@order.update_attributes(:status => "Returned")
			flash[:notice] = "You have changed the order status to Returned."
		end
		redirect_to guest_orders_admin_orders_path
	end
  
  def show
    @order = Order.find(params[:id])
     @product = Product.all
   @order_items = @order.cart.line_items
#    p @order_items.inspect
  end
  
end
