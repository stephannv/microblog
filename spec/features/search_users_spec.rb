require "rails_helper"

RSpec.feature "Search users", type: :feature do
	scenario "with valid search" do
		stephann = FactoryGirl.create(:stephann)
		walt = FactoryGirl.create(:heisenberg)

		login_as( stephann, scope: :user )

		visit "/"

		fill_in 'user_search', with: 'wa'
		click_button 'Pesquisar'

		expect(page).to have_current_path( users_path, only_path: true )
		expect(page).to have_content( walt.username )
	end
end
