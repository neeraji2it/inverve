class Admin::SubCategoriesController < ApplicationController
	before_filter :authenticate_admin!

	def index
		@sub_categories = SubCategory.all
	end

	def new
		@sub_category = SubCategory.new
	end

	def create
		@sub_category = SubCategory.new(sub_category_params)
		if @sub_category.save
			flash[:notice] = "SubCategory saved successfully"
			redirect_to admin_category_sub_categories_path(params[:category_id])
		else
			render :action => :new
		end
	end

	def edit
		@sub_category = SubCategory.find(params[:id])	
	end

	def update
		@sub_category = SubCategory.find(params[:id])
		if @sub_category.update_attributes(sub_category_params)
		flash[:notice] = "Sub Category updated successfully"
			redirect_to admin_category_sub_categories_path(params[:category_id])
		else
			render :action => :edit
		end	
	end

	def destroy
		@sub_category = SubCategory.find(params[:id])	
		if @sub_category.destroy
			flash[:notice] = "Sub Category deleted successfully"
			redirect_to admin_category_sub_categories_path(params[:category_id])
		end	
	end

	private
	def sub_category_params
		params.require(:sub_category).permit!
	end
end