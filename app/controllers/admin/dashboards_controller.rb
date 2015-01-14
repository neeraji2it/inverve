class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @categoryCount = Category.count
    @productCount = Product.count
    @userOrderCount = Order.user_orders.count
    @guestOrderCount = Order.guest_orders.count
    @userCount = User.count
  end
  
  def view_graph
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
    
    total_dates = (@start_date .. @end_date).map {|date| date}
     
    i = 0
    @course_count = []
    total_dates.count.times do |j|      
      count = Order.order_count(total_dates[i])
      @order_count << count
      i += 1
    end
    
    respond_to do |format|
      format.js
    end
  end
end