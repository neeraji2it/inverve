class Admin::GuidesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @guides = BuyingGuide.all.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @guide = BuyingGuide.new
  end
  
  def create
    @guide = BuyingGuide.new(guides_params)
    if @guide.save
      redirect_to admin_guides_path
    else
      render :action => :new
    end
  end
  
  def edit
    @guide = BuyingGuide.find(params[:id])
  end
  
  def update
    @guide = BuyingGuide.find(params[:id])
    if @guide.update_attributes(guides_params)
      flash[:notice] = "Buying Guide updated Successfully"
      redirect_to admin_guides_path
    else
      render :action => :new
    end

  end
  
  def destroy
    @guide = BuyingGuide.find(params[:id])
    if @guide.destroy
      flash[notice] = "BuyingGuides deleted Successfully"
      redirect_to admin_guides_path
    end
  end
  
  private
  def guides_params
    params.require(:buying_guide).permit!
  end
end