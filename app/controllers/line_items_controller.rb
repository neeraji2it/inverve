class LineItemsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@cart = LineItem.find_by_product_id_and_cart_id(@product.id,current_cart)
		if @cart.present?
			@cart.update_attribute(:quantity, @cart.quantity+1)
		else
			@line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.discount_price)
		end
		flash[:notice] = "Added #{@product.name} to cart."
		redirect_to carts_path
	end
end
