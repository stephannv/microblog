require "rails_helper"

RSpec.feature "View user's followers", type: :feature do
	scenario "view followers" do
		stephann = FactoryGirl.create(:stephann)
		walt = FactoryGirl.create(:heisenberg)

		stephann.follow( walt )

		login_as( stephann, scope: :user )

		visit "/users/#{walt.username}/followers"

		expect(page).to have_content( stephann.username )
	end
end
