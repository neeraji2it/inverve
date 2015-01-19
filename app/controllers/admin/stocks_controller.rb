class Admin::StocksController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @stocks = Stock.all
  end
end