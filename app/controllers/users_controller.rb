class UsersController < ApplicationController
	def index
		@search = params['user_search']
		@users = User.where.not( id: current_user.id ).where( 'username ILIKE ?', "%#{@search}%")
	end

	def show
		@user = User.find_by( username: params[:username] )
	end
end
