FactoryGirl.define do
	factory :stephann, class: User do
		username '_stephann'
		email 'stephann@microblog.com'
		bio 'ruby developer'
		location 'Fortaleza, Brazil'
		password 'postgres'
	end
end
