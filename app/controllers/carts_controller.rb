class CartsController < ApplicationController
	def show
    @cart = current_cart
  end

    def index
      @cart = current_cart
      @products = current_cart.line_items
      quantities = []
      (0..100).each do |qty|
        p qty
        quantities << qty
      end
      @quantities = quantities
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

  def update
    @cart = current_cart
    @li = LineItem.find(params[:id])

    @li.update(:quantity => params[:quantity])
    respond_to do |format|
      format.js {
        render :text => false
      }
    end
  end
end
