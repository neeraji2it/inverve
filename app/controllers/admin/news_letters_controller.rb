class Admin::NewsLettersController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @news_letters = NewsLetter.paginate(:page => params[:page], :per_page => 20)
  end
end
