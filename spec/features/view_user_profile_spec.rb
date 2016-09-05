require "rails_helper"

RSpec.feature "View user's posts", type: :feature do
	scenario "view posts" do
		stephann = FactoryGirl.create(:stephann)
		post = FactoryGirl.create( :post )

		login_as( stephann, scope: :user )

		visit "/users/#{stephann.username}/profile"

		expect(page).to have_content( post.text )
	end
end
