class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_admin!
  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to admin_categories_path
    else 
      render action: 'new'
    end
  end

  def index
    @categories = Category.search(params[:search]).paginate(:page => params[:page], :per_page => 20).order("created_at DESC")
  end

  def show
    @products = Product.searching(params[:id], params[:search])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category updated successfully."
      redirect_to admin_categories_path
    else
      render action: 'edit'
    end
  end

 #  def category_show
 #    @category = Category.find(params[:id])
 #    @category.update_attribute(:category_show, params[:category_show])
 #    redirect_to admin_categories_path
	# end
	

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category deleted successfully."     
      redirect_to admin_categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit!
  end
end