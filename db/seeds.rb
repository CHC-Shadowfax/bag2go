# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Destroying all users"
User.destroy_all
p "Creating user"
User.create(password: "bbbags1234", email: "admin@b2g.com", mobile_phone: "123456789", address: "1234 Main St, Anywhere, USA", first_name: "Gerardo", last_name: "Paz", user_type: "owner")
User.create(password: "1bagforall", email: "c1@b2g.com", mobile_phone: "123456789", address: "8457 Main St, Anywhere, USA", first_name: "Cesar", last_name: "Huallpa", user_type: "renter")
User.create(password: "2bagforall", email: "c2@b2g.com", mobile_phone: "123456789", address: "7896 Main St, Anywhere, USA", first_name: "Anna", last_name: "Ibarra", user_type: "renter")
User.create(password: "3bagforall", email: "c3@b2g.com", mobile_phone: "123456789", address: "123654 Main St, Anywhere, USA", first_name: "Jorge", last_name: "Paz", user_type: "owner")
User.create(password: "4bagforall", email: "bo1@b2g.com", mobile_phone: "123456789", address: "1278Main St, Anywhere, USA", first_name: "Laura", last_name: "Paz", user_type: "owner")
User.create(password: "5bagforall", email: "bo2@b2g.com", mobile_phone: "123456789", address: "1239 Main St, Anywhere, USA", first_name: "Liss", last_name: "Gonzalez", user_type: "renter")
p "Users created"
