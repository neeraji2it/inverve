class Admin::CategoriesController < ApplicationController

def new 
	@category = Category.new
end

def create
	@category = Category.new(category_params)
	if @category.save
		redirect_to admin_categories_path, :notice => "you have saved."
	else 
		render action: 'new'
	end
end

def index
	@categories = Category.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
end

def edit
    @category = Category.find(params[:id])
end

def show
	@category = Category.includes(:products).find(params[:id])
end

def update
	@category = Category.find(params[:id])
	if @category.update_attributes(category_params)
   redirect_to admin_categories_path
	else
	render action: 'edit'
	end
end

def category_show
	@category = Category.find(params[:id])
	@category.update_attribute(:category_show, params[:category_show])
	redirect_to admin_categories_path
	end

def destroy
	@category = Category.find(params[:id])
	@category.destroy
	redirect_to admin_categories_path
end

private
def category_params
	params.require(:category).permit(:name, :category_show , :products_attributes => [:id, :name])
end
end