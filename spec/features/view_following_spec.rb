require "rails_helper"

RSpec.feature "View user's following", type: :feature do
	scenario "view following" do
		stephann = FactoryGirl.create(:stephann)
		walt = FactoryGirl.create(:heisenberg)

		stephann.follow( walt )

		login_as( stephann, scope: :user )

		visit "/users/#{stephann.username}/following"

		expect(page).to have_content( walt.username )
	end
end
