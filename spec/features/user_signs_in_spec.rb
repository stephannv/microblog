require "rails_helper"

RSpec.feature "User signs in", type: :feature do
	scenario "with valid credentials" do
		stephann = FactoryGirl.create :stephann

		visit "/users/sign_in"

		fill_in 'user_email', with: stephann.email
		fill_in 'user_password', with: stephann.password

		click_button 'Log in'

		expect(page).to have_current_path( root_path )
	end
end
