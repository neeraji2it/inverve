require 'spec_helper'
require 'factory_girl_rails'

describe Admin::ProductsController do 
	describe "GET #index" do 

		 it "renders the index template" do
			product = FactoryGirl.create(:product)
			get :index
			 response.should be_redirect 		
		end
	
	end 

end