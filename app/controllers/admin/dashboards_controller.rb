class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @categoryCount = Category.count
    @productCount = Product.count
    @userOrderCount = Order.user_orders.count
    @guestOrderCount = Order.guest_orders.count
    @userCount = User.count
  end
end