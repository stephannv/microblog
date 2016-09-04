FactoryGirl.define do
	factory :stephann_follow_walt, class: 'Follow' do
		follower {
			attributes = FactoryGirl.attributes_for(:stephann)
			User.find_by( attributes.except(:password) ) || User.create!( attributes )
		}

		followable {
			attributes = FactoryGirl.attributes_for(:heisenberg)
			User.find_by( attributes.except(:password) ) || User.create!( attributes )
		}
	end
end
