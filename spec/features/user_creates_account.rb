require "rails_helper"

RSpec.feature "User creates account", type: :feature do
	scenario "with valid info" do
		visit "/users/sign_up"

		fill_in 'user_email', with: 'stephann@microblog.com'
		fill_in 'user_username', with: 'stephann'
		fill_in 'user_password', with: 'postgres'
		fill_in 'user_password_confirmation', with: 'postgres'

		click_button 'Sign up'

		expect(page).to have_current_path( root_path )
	end
end
