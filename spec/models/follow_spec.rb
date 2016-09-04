require 'rails_helper'

RSpec.describe Follow, type: :model do
	it{ is_expected.to belong_to( :follower ).class_name('User') }
	it{ is_expected.to belong_to( :followable ).class_name('User') }

	it{ is_expected.to validate_presence_of :follower_id }
	it{ is_expected.to validate_presence_of :followable_id }

	it{
		FactoryGirl.create :stephann_follow_walt
		is_expected.to validate_uniqueness_of( :followable_id ).scoped_to( :follower_id)
	}
end
