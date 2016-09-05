require "rails_helper"

RSpec.feature "Create post", type: :feature do
	scenario "with valid text" do
		stephann = FactoryGirl.create(:stephann)

		login_as( stephann, scope: :user )

		visit "/"

		fill_in 'post_text', with: 'Meu post'
		click_on 'Postar'

		expect(page).to have_current_path( root_path )
		expect(page).to have_content( 'Meu post' )
	end
end
