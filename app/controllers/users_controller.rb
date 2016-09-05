class UsersController < ApplicationController
	before_action :set_user, except: :index
	def index
		@search = params['user_search']
		@users = User.where.not( id: current_user.id ).where( 'username ILIKE ?', "%#{@search}%")
	end

	def show
	end

	def follow
		if current_user.follow( @user )
			send_new_follower_notification @user
			head :created
		else
			head :unprocessable_entity
		end
	end

	def unfollow
		if current_user.unfollow( @user )
			head :ok
		else
			head :unprocessable_entity
		end
	end

	def followers
		@followers = @user.all_followers
	end

	def following
		@following = @user.all_followings
	end

	private
	def set_user
		@user = User.find_by( username: params[:username] )
	end

	def send_new_follower_notification followable
		NewFollowerNotificationChannel.broadcast_to( followable, username: current_user.username )
	end
end
