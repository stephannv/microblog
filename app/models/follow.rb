class Follow < ApplicationRecord
	belongs_to :followable, class_name: 'User'
	belongs_to :follower, class_name: 'User'

	validates_presence_of :follower_id
	validates_presence_of :followable_id

	validates_uniqueness_of :followable_id, scope: :follower_id
end
