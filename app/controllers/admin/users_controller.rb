class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!
  def index
   @users = User.paginate(:page => params[:page], :per_page => 20).all 
  end
end