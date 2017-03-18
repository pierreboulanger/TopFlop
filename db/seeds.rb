# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.create([
  { name: "Les Patrons"},
  { name: "Colo-Colo United"}
  ])

User.create([
    { email: "piet@test.com"},
    { name: "Boul1"},
    { shirt_number: "15"},
    { field_position: "DC"},
    {team_id: 1}
  ])
User.create([
    { email: "piet@test2.com"},
    { name: "Boul2"},
    { shirt_number: "10"},
    { field_position: "ATT"},
    {team_id: 1}
  ])
User.create([
    { email: "piet@test3.com"},
    { name: "Boul3"},
    { shirt_number: "8"},
    { field_position: "MIL"},
    {team_id: 1}
  ])

Game.create([
  { team_id: 1},
  { opponent_name: "Touticuanti"},
  { date: "25/02/17"}
  ])

Top.create([
  {game_id: 1},
  {user_id: 2},
  {comment: "ceci est un top pour boul1 par boul2"},
  {topplayer: 1}
  ])

Flop.create([
  {game_id: 1},
  {user_id: 2},
  {comment: "ceci est un flop pour boul3 par boul2"},
  {flopplayer: 3}
  ])
