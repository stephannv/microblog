require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	it{ is_expected.to use_before_filter :authenticate_user! }

	describe "GET #create" do
		login_user

		let(:valid_attributes){ FactoryGirl.attributes_for :post }
		let(:invalid_attributes){ { text: '' } }

		it 'permit only whitelisted params' do
			params = { params: { post: { text: 'My first post!'} } }
			is_expected.to permit(:text).for(:create, params: params).on(:post)
		end

		context 'with valid attributes' do
			it "create a new post for current user" do
				expect{
					post :create, params: { post: valid_attributes }
				}.to change( controller.current_user.posts, :count ).by( 1 )
			end

			it "doesn't set flash error message" do
				is_expected.to_not set_flash[:alert]
			end

			it "redirects to root path" do
				post :create, params: { post: valid_attributes }
				is_expected.to redirect_to root_path
			end
		end

		context 'with invalid attributes' do
			it "doesn't save the post" do
				expect{
					post :create, params: { post: invalid_attributes }
				}.to_not change( Post, :count )
			end

			it "set flash error message" do
				post :create, params: { post: invalid_attributes }
				is_expected.to set_flash[:alert].to('Ocorreu um erro')
			end

			it "redirects to root path" do
				post :create, params: { post: invalid_attributes }
				is_expected.to redirect_to root_path
			end
		end
	end
end
