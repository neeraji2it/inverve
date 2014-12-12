require 'spec_helper'

describe Image  do

	it { should have_attached_file(:avatar) }
	it { should validate_attachment_content_type(:avatar).
		allowing('image/png', 'image/gif').
		rejecting('text/plain', 'text/xml') }
	it { should belong_to (:product) }

	end	