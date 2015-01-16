class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @categoryCount = Category.count
    @productCount = Product.count
    @userOrderCount = Order.user_orders.count
    @guestOrderCount = Order.guest_orders.count
    @userCount = User.count
    @start_date = Date.parse(1.years.ago.strftime("%Y-%m-%d"))
    @end_date = Date.parse(DateTime.now.strftime("%Y-%m-%d"))
    orders(@start_date, @end_date)
  end
  
  def view_graph
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
    orders(@start_date, @end_date)
    respond_to do |format|
      format.js
    end
  end

  def orders(start_date, end_date)    
    total_dates = (start_date .. end_date).map { |v| v }
    i = 0
    @order_count = []
    total_dates.count.times do |j|
      count = Order.order_count(total_dates[i])
      @order_count << count
      i += 1
    end    
  end
end