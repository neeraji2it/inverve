class HomesController < ApplicationController
	def index
		@categories = Category.search(params[:search])
		@products = Product.search(params[:search])
	end
# def category
# @categories = Category.where("id = '#{params[:category_id]}'")
# respond_to do |format|
# format.js
def show
	@category = Category.find(params[:id])
	@products = @category.products
end

def offers
	@products = Product.where("discount != ''")
end

def product_flags
	@products = Product.where("flag != ''")
end

private
def product_params
	params.require(:product).permit!
end
end