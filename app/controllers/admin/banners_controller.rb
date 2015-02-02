class Admin::BannersController < ApplicationController
 before_filter :authenticate_admin!
 def index
  @banner_images = Banner.paginate(:page => params[:page], :per_page => 20)
end

def new
  @banner_image = Banner.new
end

def show
   @banner_image = Banner.find(params[:id])
end

def create
  @banner_image = Banner.new(banner_params)
  if @banner_image.save
    redirect_to admin_banners_path
  else
    render :action => 'new'
  end
end

def edit
  @banner_image = Banner.find(params[:id])
end

def update
  @banner_image = Banner.find(params[:id])
  if @banner_image.update_attributes(banner_params)
    redirect_to admin_banners_path
  else
    render :action => 'edit'
  end
end

def destroy
  @banner_image = Banner.find(params[:id])
  @banner_image.destroy
  redirect_to admin_banners_path
end
private
def banner_params
  params.require(:banner).permit!
end
end
