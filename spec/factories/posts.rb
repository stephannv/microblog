FactoryGirl.define do
	factory :post do
		user { User.find_or_create_by!( FactoryGirl.attributes_for(:stephann).except(:password) ) }
		text "First!!!"
	end
end
