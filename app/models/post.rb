class Post < ApplicationRecord
	belongs_to :user

	validates_presence_of :user_id
	validates_presence_of :text
	
	validates_length_of :text, maximum: 256
end
