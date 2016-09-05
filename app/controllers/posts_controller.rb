class PostsController < ApplicationController
	def create
		post = current_user.posts.new( post_params )

		unless post.save
			@alert = 'Ocorreu um erro'
		end

		redirect_to root_path, alert: @alert
	end

	private
	def post_params
		params.require(:post).permit(:text)
	end
end
