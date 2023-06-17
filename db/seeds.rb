# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Creating user"
User.create(password: "bbbags1234", email: "admin@b2g.com")
User.create(password: "1bagforall", email: "c1@b2g.com")
User.create(password: "2bagforall", email: "c2@b2g.com")
User.create(password: "3bagforall", email: "c3@b2g.com")
User.create(password: "4bagforall", email: "bo1@b2g.com")
User.create(password: "5bagforall", email: "bo2@b2g.com")
p "users created"
