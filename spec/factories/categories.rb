require 'faker'

FactoryGirl.define do
	factory :category do |f|
		f.name {Faker::Commerce.name}

	end
end