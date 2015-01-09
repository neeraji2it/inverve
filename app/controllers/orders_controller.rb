class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end



  def show

  end

  def new
    if current_user.present?
      @user = current_user
    else
      @email = "#{SecureRandom.hex(13)}@guest.com"
      @user = User.new(email: @email, password: SecureRandom.hex(20))
      @user.save(validate: false)
    end

    p "************************"
    p @user.inspect
    p "********************"
    
    @order = @user.orders.first

    if @order.blank?
      @order = Order.new(user_id: @user.id)
    end

    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to carts_path
      return
    end
  end 

  def create
    @order = current_cart.build_order(order_params)
    if current_user.present?
      @order.user_id = current_user.id 
    end
    @order.ip_address = request.remote_ip
    if @order.save
      redirect_to orders_path
    else
      render action: 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order.update(order_params)
    redirect_to orders_path   
  end

  def destroy
    @order.destroy
    redirect_to carts_path
  end
  def confirm
    @order = Order.find(params[:id])
    @product = Product.all
  end

  def confirm_myorder
  end

  def myorder
    all_carts = []
    @orders = current_user.try(:orders)
    @carts = @orders.map {|order| order.try(:cart)}
    @carts.map {|cart| all_carts << cart}
    @all_carts = all_carts
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
