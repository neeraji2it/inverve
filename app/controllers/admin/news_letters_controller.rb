class Admin::NewsLettersController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @news_letters = NewsLetter.all
  end
end
