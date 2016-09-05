require "rails_helper"

RSpec.feature "View timeline", type: :feature do
	scenario "view own & friend's posts" do
		stephann = FactoryGirl.create(:stephann)
		walt = FactoryGirl.create(:heisenberg)

		FactoryGirl.create( :post, user: stephann )
		FactoryGirl.create( :post, user: walt
		)
		stephann.follow( walt )

		login_as( stephann, scope: :user )

		visit "/"

		stephann.timeline_posts.each do |post|
			expect(page).to have_content( post.text )
		end
	end
end
