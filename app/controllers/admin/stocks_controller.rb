class Admin::StocksController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)
  end

  def edit

  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [admin, @product], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit!
    end
end