require 'rails_helper'

RSpec.describe User, type: :model do
	let(:follow){ FactoryGirl.create( :stephann_follow_walt ) }
	let(:stephann){ FactoryGirl.create( :stephann ) }
	let(:walt){ FactoryGirl.create( :heisenberg ) }

	it{ is_expected.to have_many( :posts ).dependent( :destroy ) }
	it{ is_expected.to have_many( :follows ).with_foreign_key('follower_id').dependent( :destroy ) }
	it{ is_expected.to have_many( :followings ).class_name('Follow').with_foreign_key('followable_id').dependent( :destroy ) }

	it{ is_expected.to validate_presence_of :username }

	it{
		FactoryGirl.create :stephann
		is_expected.to validate_uniqueness_of :username
	}

	it{ is_expected.to validate_length_of( :username ).is_at_most(12) }
	it{ is_expected.to validate_length_of( :bio ).is_at_most(256) }
	it{ is_expected.to validate_length_of( :location ).is_at_most(80) }

	it { is_expected.to allow_value('stephann_').for(:username) }
	it { is_expected.to_not allow_values('stephann.v', 'ste phann').for(:username) }

	describe "#to_param" do
		it "returns username" do
			stephann = FactoryGirl.build :stephann
			expect( stephann.to_param ).to eq stephann.username
		end
	end

	describe "#follow" do
		context "when follows a user not followed yet by self" do
			it "create a follow" do
				expect{
					stephann.follow walt
				}.to change( stephann.follows, :count ).by( 1 )
			end
		end

		context "when follows nil" do
			it "doesn't follow" do
				expect{
					stephann.follow nil
				}.to_not change( stephann.follows, :count )
			end
		end

		context "when follows self" do
			it "doesn't follow" do
				expect{
					stephann.follow stephann
				}.to_not change( stephann.follows, :count )
			end
		end

		context "when follows a user already followed by self" do
			it "doesn't create another follow" do
				stephann.follow walt

				expect{
					stephann.follow walt
				}.to_not change( stephann.follows, :count )
			end
		end
	end

	describe "#unfollow" do
		context "when unfollow a user followed by self" do
			it "destroys follow" do
				stephann.follow walt

				expect{
					stephann.unfollow walt
				}.to change( stephann.follows, :count ).by( -1 )
			end
		end

		context "when unfollow nil" do
			it "doesn't unfollow" do
				expect{
					stephann.unfollow nil
				}.to_not change( stephann.follows, :count )
			end
		end

		context "when unfollow a user not followed by self" do
			it "doesn't unfollow" do
				expect{
					stephann.unfollow walt
				}.to_not change( stephann.follows, :count )
			end
		end
	end

	describe '#all_followers' do
		it 'returns all followers' do
			stephann = follow.follower
			walt = follow.followable

			expect( walt.all_followers ).to eq [stephann]
		end
	end

	describe '#all_followings' do
		it 'returns all followings' do
			stephann = follow.follower
			walt = follow.followable

			expect( stephann.all_followings ).to eq [walt]
		end
	end

	describe '#followed_by?' do
		context 'when user is a follower' do
			it 'returns true' do
				stephann = follow.follower
				walt = follow.followable

				expect( walt.followed_by?( stephann ) ).to be_truthy
			end
		end

		context "when user isn't a follower" do
			it 'returns false' do
				expect( stephann.followed_by?( walt ) ).to be_falsy
			end
		end
	end

	describe '#follow?' do
		context 'when follows user' do
			it 'returns true' do
				stephann = follow.follower
				walt = follow.followable

				expect( stephann.follow?( walt ) ).to be_truthy
			end
		end

		context "when doesn't isn't a follower" do
			it 'returns false' do
				expect( walt.follow?( stephann ) ).to be_falsy
			end
		end
	end
end
