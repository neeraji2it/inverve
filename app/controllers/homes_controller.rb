class HomesController < ApplicationController
	def index
    @featured = Product.featured
  end
  
  def category
    @categories = Category.where("id = '#{params[:category_id]}'")
    respond_to do |format|
      format.js
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @products = @category.products.paginate(:page => params[:page], :per_page => 25)
    @featured = Product.featured
  end

  def offers

    @products = Product.where("discount != ''")
  end

  def product_flags
    @products = Product.where("is_featured != ''")
  end

  def single_product
    @product = Product.find(params[:id])
    @images = @product.images
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
    @products = products.paginate(:page => params[:page], :per_page => 25)
    @categories = Category.all
    @featured = Product.featured
  end
  
  def new_news_letter
    @news_letter = NewsLetter.new
  end
  
  def post_news_letter
    @news_letter = NewsLetter.new(news_letter_params)
    if @news_letter.save
      flash[:notice] = "Thanks you have been subscribed to news letter."
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def product_params
    params.require(:product).permit!
  end
  
  def news_letter_params
    params.require(:news_letter).permit!
  end
end