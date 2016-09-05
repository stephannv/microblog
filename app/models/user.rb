class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

	has_many :posts, dependent: :destroy
	has_many :follows, foreign_key: 'follower_id', dependent: :destroy
	has_many :followings, foreign_key: 'followable_id', class_name: 'Follow', dependent: :destroy

	validates_presence_of :username

	validates_uniqueness_of :username

	validates_length_of :username, maximum: 12
	validates_length_of :bio, maximum: 256
	validates_length_of :location, maximum: 80

	validates_format_of :username, with: /\A[a-zA-Z0-9_]+\Z/

	def to_param
		username
	end

	def follow user
		if user && user != self
			self.follows.find_or_create_by( followable_id: user.id )
		end
	end

	def unfollow user
		follow = self.follows.find_by(followable_id: user.id ) if user
		follow.try(:destroy)
	end

	def all_followers
		self.followings.map{ |following| following.follower }
	end

	def all_followings
		self.follows.map{ |follow| follow.followable }
	end

	def follow? user
		self.all_followings.include? user
	end

	def followed_by? user
		self.all_followers.include? user
	end

	def timeline_posts
		Post.where( user_id: all_followings.pluck(:id) << self.id ).order( 'created_at DESC' )
	end
end
