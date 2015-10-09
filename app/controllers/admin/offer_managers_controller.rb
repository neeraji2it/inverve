class Admin::OfferManagersController < ApplicationController
  before_action :offer_collections

  def index
    
  end

  def offer_go
    if @offer_go.update_attributes(offer_go_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Offer-Go content are updated!"
    else
      render 'index'
    end
  end

  private

  def offer_go_params
    params.require(:offer_collection).permit(:go_text, :go_percent, :go_parent)
  end

 
end
