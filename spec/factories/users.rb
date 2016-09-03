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
end
