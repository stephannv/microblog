FactoryGirl.define do
	factory :post do
		user_id { User.find_or_create_by!( FactoryGirl.attributes_for(:stephann) ) }
		text "First!!!"
	end
end
