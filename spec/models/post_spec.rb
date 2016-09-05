require 'rails_helper'

RSpec.describe Post, type: :model do
	it{ is_expected.to belong_to :user }

	it{ is_expected.to validate_presence_of :user_id }
	it{ is_expected.to validate_presence_of :text }

	it{ is_expected.to validate_length_of( :text ).is_at_most(256) }
end
