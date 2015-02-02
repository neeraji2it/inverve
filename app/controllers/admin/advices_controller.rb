class Admin::AdvicesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @advices = Advice.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
   @advice = Advice.new 
  end
  
  def create
    @advice = Advice.new(advice_params)
    if @advice.save
      flash[:notice] = "Advices created Successfully"
      redirect_to admin_advices_path
    else
      render :action => :new
    end
  end
  
  def edit
    @advice = Advice.find(params[:id])
  end
  
  def update
    @advice = Advice.find(params[:id])
    if @advice.update_attributes(advice_params)
      flash[:notice] = "Advices updated Successfully"
      redirect_to admin_advices_path
    else
      render :action => :new
    end

  end
  
  def destroy
    @advice = Advice.find(params[:id])
    if @advice.destroy
      flash[notice] = "Advices deleted Successfully"
      redirect_to admin_advices_path
    end
  end
  
  private
  def advice_params
    params.require(:advice).permit!
  end
end