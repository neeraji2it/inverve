class Admin::ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_admin!
  
  def new 
    @product = Product.new
    if @product.images.blank?
      @product.images.build
    end
    @product.images.destroy
    @product.images.clear
  end

  def create
    @product_colors = params[:color_ids]
    @product = Product.new(product_params.merge(:category_id => params[:product][:category_id]))
    if @product.save
      redirect_to admin_products_path, :notice =>"Product is saved successfully."
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 25).order("created_at DESC ")
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_products_path
    else
      render action: 'edit'
    end
  end 

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to admin_products_path
  end

  def delete_img
    @product = Product.find(params[:product_id])
    @image = @product.images.find(params[:id])
    if @image.destroy
      redirect_to admin_product_path(@product)
    end
  end
  
  def image_show
    @product = Product.find(params[:id])
    @image = @product.images.find(params[:image_id])
    @image.update_attributes(:image_show => params[:image_show])
    redirect_to admin_product_path(@product)
  end

  def discount
    @product = Product.find(params[:id])
    @product.update_attributes
    redirect_to admin_product_path(@product)
  end


  def flag
    @product = Product.find(params[:id])
    @product.update_attributes(:is_featured => params[:is_featured])
    redirect_to admin_products_path
  end
  
  private
 
  def product_params
    params.require(:product).permit!
  end
end