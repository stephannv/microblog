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
		username: 'underwood',
		email: 'francis@gov.us',
		location: 'Washington, DC',
		bio: "God bless America",
		password: 'meechum'
	},
	{
		username: 'demogorgon',
		email: 'demogorgon@outlook.com',
		location: 'Mundo invertido',
		bio: "I love will",
		password: 'upsidedown'
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

walt = User.find_by( username: 'walt' )
walt.posts.create( text: 'YOU’RE AN INSANE, DEGENERATE PIECE OF FILTH, AND YOU DESERVE TO DIE', created_at: 24.hours.ago )
walt.posts.create( text: 'STAY OUT OF MY TERRITORY', created_at: 20.hours.ago )
walt.posts.create( text: 'MAY HIS DEATH SATISFY YOU.' )
walt.posts.create( text: 'LA FAMILIA ES TODO.', created_at: 2.weeks.ago )
walt.posts.create( text: 'I AM THE ONE WHO KNOCKS.', created_at: 1.day.ago )

underwood = User.find_by( username: 'underwood' )
underwood.posts.create( text: "I have zero tolerance for betrayal, which they will soon indelibly learn.", created_at: 1.week.ago )
underwood.posts.create( text: "The road to power is paved with hypocrisy, and casualties. Never regret.", created_at: 3.days.ago )
underwood.posts.create( text: "Shake with your right hand, but hold a rock in the left.", created_at: 1.day.ago )
underwood.posts.create( text: "If you don’t like how the table is set, turn over the table." )
