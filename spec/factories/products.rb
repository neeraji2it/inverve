require 'faker'

FactoryGirl.define do
	factory :product do |f|
		f.description {Faker::Lorem.paragraph}
		f.name {Faker::Commerce.product_name}
		f.price {Faker::Commerce.price}
		f.category_id {Faker::Commerce.department}

	end
end
