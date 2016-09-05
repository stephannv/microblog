require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	it{ is_expected.to use_before_filter :authenticate_user! }

	describe 'POST #follow' do
		login_user

		let(:walt){ FactoryGirl.create(:heisenberg) }

		context "when user can be followed" do
			it "responds with :created status" do
				post :follow, params: { username: walt.username }
				is_expected.to respond_with :created
			end

			it "broadcasts a new follower notification to followable" do
				expect( NewFollowerNotificationChannel ).to receive( :broadcast_to )
					.with( walt, username: controller.current_user.username )

				post :follow, params: { username: walt.username }
			end
		end

		context "when user can't be followed" do
			it "responds with :unprocessable_entity status" do
				post :follow, params: { username: 'demogorgon' }
				is_expected.to respond_with :unprocessable_entity
			end
		end
	end

	describe 'DELETE #follow' do
		login_user

		let(:walt){ FactoryGirl.create(:heisenberg) }

		context "when user can be unfollowed" do
			it "responds with :ok status" do
				controller.current_user.follow walt

				delete :unfollow, params: { username: walt.username }
				is_expected.to respond_with :ok
			end
		end

		context "when user can't be unfollowed" do
			it "responds with :unprocessable_entity status" do
				delete :unfollow, params: { username: 'demogorgon' }
				is_expected.to respond_with :unprocessable_entity
			end
		end
	end
end
