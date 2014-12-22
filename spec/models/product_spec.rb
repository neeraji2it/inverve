require 'spec_helper'
require 'factory_girl_rails'

describe Product do

	it "has a valid factory" do 
		FactoryGirl.create(:product).should be_valid 
	end
	it "is invalid without a description" do
		FactoryGirl.build(:product, description: nil). should_not be_valid
	end	
	it "is invalid without uniqueness of name" do
		FactoryGirl.build(:product, name: nil).should_not be_valid
	end
	it "is invalid without a category_id" do
		FactoryGirl.build(:product, category_id: nil).should_not be_valid
	end

	it "is invalid without a price" do
		FactoryGirl.build(:product, price: nil).should_not be_valid
	end

	it{should belong_to (:category)}
	it{should have_many (:line_items)}
	it { should have_many(:images).dependent(:destroy) }
	it do
		should accept_nested_attributes_for(:images).
		allow_destroy(true)
	end

end
