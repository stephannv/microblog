class CreateFollows < ActiveRecord::Migration
	def change
		create_table :follows, :force => true do |t|
			t.references :followable, references: :users, null: false
			t.references :follower,   references: :users, null: false

			t.timestamps
		end

		add_foreign_key :follows, :users, column: :followable_id
		add_foreign_key :follows, :users, column: :follower_id

		add_index :follows, :follower_id, name: :fk_follows
		add_index :follows, :followable_id, name: :fk_followables
	end
end
