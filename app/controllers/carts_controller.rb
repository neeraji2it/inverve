class CartsController < ApplicationController
  before_action :load_cart, except: [:destroy]

  def show
  end

  def index
    @products = current_cart.line_items
  end

  def destroy
    @cart = LineItem.find(params[:id])
    if @cart.destroy
      if !current_cart.line_items.present?
        current_cart.destroy
        session[:cart_id] = nil
      end
      redirect_to carts_path
    end
  end

  def empty_carts
    if current_cart.line_items.present?
      current_cart.destroy
      session[:cart_id] = nil
    end
    redirect_to carts_path
  end

  def update
    @products = current_cart.line_items
    @li = LineItem.find(params[:id])
    @li.update(:quantity => params[:quantity])
    respond_to do |format|
      format.js
    end
  end
  
  def discount
    @products = current_cart.line_items
  end

  private
  def load_cart
    @cart = current_cart
  end
end