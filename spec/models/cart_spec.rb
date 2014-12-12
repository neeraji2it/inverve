require 'spec_helper'
 
describe Cart do

	it{should have_many (:line_items)}
	it{should have_one (:order)}
end