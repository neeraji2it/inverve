class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in?
 

  def index
    @orders = Order.all
    
  end

  def show
    
  end
    def new
    @order = Order.new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to carts_path
      return
    end
  end

  def edit
  end

  def create
    @order = current_cart.build_order(order_params)
    @order.ip_address = request.remote_ip
    if @order.save
    redirect_to orders_path
    else
      render action: 'new'
  end
end

  def update
    @order.update(order_params)
    redirect_to orders_path
    
  end

  def destroy
    @order.destroy
    redirect_to orders_path
    
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit( :first_name, :last_name, :address, :landmark, :pincode, :city, :state, :country, :phone)
    end
end

