require "rails_helper"

RSpec.feature "User sign out", type: :feature do
	scenario "when logged in" do
		stephann = FactoryGirl.create(:stephann)
		login_as( stephann, :scope => :user )

		visit "/"

		click_on 'Log out'

		expect(page).to have_current_path( new_user_session_path )
	end
end
