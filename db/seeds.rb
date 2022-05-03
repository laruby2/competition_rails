# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
contestants = Contestant.create([
  { name: "Trapp Family Singers", location: "Salzburg" },
  { name: "TShirts", location: "La Cañada Flintridge" },
  { name: "Star Wars", location: "Galaxy" }
])
User.create(username: "jimmy", phone_number: "abcd123", password: "1111")
