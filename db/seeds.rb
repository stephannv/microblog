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
		password: 'teste123'
	},
	{
		username: 'underwood',
		email: 'francis@gov.us',
		location: 'Washington, DC',
		bio: "God bless America",
		password: 'teste123'
	},
	{
		username: 'saulgoodman',
		email: 'saul@goodman.com',
		location: 'Albuquerque',
		bio: "Better Call Saul",
		password: 'teste123'
	},
	{
		username: 'michaelscott',
		email: 'scott@dundermifflin.com',
		location: 'Scranton',
		bio: "NO, NO, NO",
		password: 'teste123'
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

saulgoodman = User.find_by( username: 'saulgoodman' )
saulgoodman.posts.create( text: "There's no honor among thieves... except for us of course.", created_at: 1.month.ago )
saulgoodman.posts.create( text: "He said he was gonna break my legs, and don't tell me he didn't mean it because he gave me the dead mackerel eyes.", created_at: 4.days.ago )
saulgoodman.posts.create( text: "Some people are immune to good advice.", created_at: 1.day.ago )
saulgoodman.posts.create( text: "Don't drink and drive. But if you do, call me." )

michaelscott = User.find_by( username: 'michaelscott' )
michaelscott.posts.create( text: "Make friends first, make sales second, make love third. In no particular order.", created_at: 3.days.ago )
michaelscott.posts.create( text: "Would I rather be feared or loved? Easy, both. I want people to be afraid of how much they love me.", created_at: 2.days.ago )
michaelscott.posts.create( text: "You need to play to win. But you also have to win to play.", created_at: 10.hours.ago )
michaelscott.posts.create( text: "The people that you work with are, when you get down to it, your very best friends." )

walt.follow( underwood )
walt.follow( michaelscott )

michaelscott.follow( walt )

underwood.follow( michaelscott )
underwood.follow( saulgoodman )

saulgoodman.follow( underwood )
saulgoodman.follow( michaelscott )
saulgoodman.follow( walt )
