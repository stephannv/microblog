require 'rails_helper'

RSpec.describe User, type: :model do
	it{ is_expected.to have_many( :posts ).dependent( :destroy ) }

	it{ is_expected.to validate_presence_of :username }

	it{
		FactoryGirl.create :stephann
		is_expected.to validate_uniqueness_of :username
	}

	it{ is_expected.to validate_length_of( :username ).is_at_most(12) }
	it{ is_expected.to validate_length_of( :bio ).is_at_most(256) }
	it{ is_expected.to validate_length_of( :location ).is_at_most(80) }

	describe "#to_param" do
		it "return username" do
			stephann = FactoryGirl.build :stephann
			expect( stephann.to_param ).to eq stephann.username
		end
	end
end
