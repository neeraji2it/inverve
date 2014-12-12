require 'spec_helper'
require 'factory_girl_rails'

describe Product do

	it "has a valid factory" do 
		FactoryGirl.create(:product).should be_valid 
	end
	it "is invalid without a description" do
		FactoryGirl.build(:product, description: nil). should_not be_valid
	end
	it "is invalid without a name" do
		FactoryGirl.build(:product, name: nil).should_not be_valid
	end
	it "is invalid without a category_id" do
		FactoryGirl.build(:product, category_id: nil).should_not be_valid
	end

	it "is invalid without a price" do
		FactoryGirl.build(:product, price: nil).should_not be_valid
	end
end