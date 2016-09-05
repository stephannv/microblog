FactoryGirl.define do
	factory :stephann, class: User do
		username '_stephann'
		email 'stephann@microblog.com'
		bio 'ruby developer'
		location 'Fortaleza, Brazil'
		password 'postgres'
	end

	factory :heisenberg, class: User do
		username 'walt'
		email 'walter@bol.com.br'
		bio 'professor'
		location 'Albuquerque'
		password 'metafetamina'
	end

	factory :underwood, class: User do
		username 'underwood'
		email 'underwood@gov.us'
		bio 'God Bless America'
		location 'Washington, DC'
		password 'meechum'
	end
end
