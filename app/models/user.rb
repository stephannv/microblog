class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

	has_many :posts, dependent: :destroy

	validates_presence_of :username

	validates_uniqueness_of :username

	validates_length_of :username, maximum: 12
	validates_length_of :bio, maximum: 256
	validates_length_of :location, maximum: 80
end
