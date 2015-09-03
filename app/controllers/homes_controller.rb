class HomesController < ApplicationController
	def index
    @featured = Product.featured
    @advices = Advice.all
    @banner_images = Banner.all
    @guides = BuyingGuide.all
  end

  def index_test
  end
  
  def category
    @categories = SubCategory.where("id = '#{params[:category_id]}'")
    @categories = Category.where("id = '#{params[:category_id]}'")
    respond_to do |format|
      format.js
    end
  end
  
  def show
  # @sub_category = params[:category_id].present? ? Category.find(params[:category_id]) : SubCategory.find(params[:id])
   # @categories = params[:category_id].present? ? @sub_category.sub_categories : @sub_category.category.sub_categories
   # @products = @sub_category.products.paginate(:page => params[:page], :per_page => 20)
   # @featured = Product.featured

    @categories = Category.where("id = '#{params[:category_id]}'")
@category = Category.find(params[:id])
   @products = @category.products.paginate(:page => params[:page], :per_page => 20)
   @featured = Product.featured

 end


  def offers
    @products = Product.where("discount != ''").paginate(:page => params[:page], :per_page => 20)
  end

def product_flags
  @products = Product.where("is_featured != ''")
end

def single_product
  @product = Product.find(params[:id])
  @images = @product.images
  @category = @product.category
  @similars = @category.products.where.not(id: @product.id)
end

def guide
  @guide = BuyingGuide.find(params[:id])
end

def how_to_buy

end

def faq

end

def payment

end

def shipment

end

def terms

end

def return_policy

end

def search
  products = Product.search(params[:search])
  @products = products.paginate(:page => params[:page], :per_page => 20)
end

def new_news_letter
  @news_letter = NewsLetter.new
end

def post_news_letter
  @news_letter = NewsLetter.new(news_letter_params)
  if @news_letter.save
    flash[:notice] = "Thanks, you have been subscribed to news letter."
  end
  respond_to do |format|
    format.js
  end
end

def inspirations
  @advice = Advice.find(params[:id])
end

def load_image
  @product = Product.find(params[:product_id])
  @image = @product.images.where("id=?", params[:id]).first
end

private
def product_params
  params.require(:product).permit!
end

def news_letter_params
  params.require(:news_letter).permit!
end
end