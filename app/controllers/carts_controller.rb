class CartsController < ApplicationController
	def show
    @cart = current_cart
  end
  def index
    @cart = current_cart
    @products = current_cart.line_items
    end
    def destroy
    @cart = LineItem.find(params[:id])
    if @cart.destroy
      if !current_cart.line_items.present?
        current_cart.destroy
        session[:cart_id] = nil
      end
      redirect_to carts_path
    end
  end
end
