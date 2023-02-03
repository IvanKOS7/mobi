# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
EVENTS = ['goal', 'assists', 'goal_assists', 'penalti'].freeze

teams = Team.create!([
  {
    name: Faker::ProgrammingLanguage.name
  },
  {
    name: Faker::ProgrammingLanguage.name
  },
  {
    name: Faker::ProgrammingLanguage.name
  }
])

3.times do
  players = Player.create!([
    {
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      team: teams.first
    },
    {
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      team: teams.second

    },
    {
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      team: teams.third
    }
  ])
end

achievements = Achievement.create!([
  {
    name: '3+ goals',
    event: 'goal',
    count: 3
  },
  {
    name: '30+ mileage',
    event: 'mileage',
    count: 30
  }
])

games = Game.create!([
  {
    home_team: teams.first,
    away_team: teams.second
  },
  {
    home_team: teams.first,
    away_team: teams.third
  }
])

events = GameEvent.create!([
  {
    player: teams.first.players.second,
    game: games.sample,
    count: rand(100),
    event: EVENTS.sample
  },
  {
    player: teams.first.players.last,
    game: games.sample,
    count: rand(100),
    event: EVENTS.sample
  },
  {
    player: teams.second.players.first,
    game: games.sample,
    count: rand(100),
    event: EVENTS.sample
  },
  {
    player: teams.last.players.first,
    game: games.sample,
    count: rand(100),
    event: EVENTS.sample
  }
])
