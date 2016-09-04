# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
	{
		username: 'walt',
		email: 'walterwhite@bol.com.br',
		location: 'Albuquerque',
		bio: "I'm the danger",
		password: 'metafetamina'
	},
	{
		username: 'demogorgon',
		email: 'Demogorgon@outlook.com',
		location: 'Mundo invertido',
		bio: "I love will",
		password: 'upsidedown'
	},
	{
		username: 'underwood',
		email: 'francis@gov.us',
		location: 'Washington, DC',
		bio: "God bless America",
		password: 'meechum'
	},
	{
		username: 'saulgoodman',
		email: 'saul@goodman.com',
		location: 'Albuquerque',
		bio: "Better Call Saul",
		password: 'saulgoodman'
	},
	{
		username: 'michaelscott',
		email: 'scott@dundermifflin.com',
		location: 'Scranton',
		bio: "NO, NO, NO",
		password: 'hollyflax'
	},
].each do |user|
	User.create! user
end
