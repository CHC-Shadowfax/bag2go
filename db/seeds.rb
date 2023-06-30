# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Destroying bookings"

Booking.destroy_all

p "Removing all bags"

Bag.destroy_all

p "Destroying all users"
User.destroy_all
p "Creating users"
User.create(password: "bbbags1234", email: "admin@b2g.com", mobile_phone: "123456789", address: "1234 Main St, Anywhere, USA", first_name: "Gerardo", last_name: "Paz", user_type: "owner")
User.create(password: "1bagforall", email: "c1@b2g.com", mobile_phone: "123456789", address: "8457 Main St, Anywhere, USA", first_name: "Cesar", last_name: "Huallpa", user_type: "renter")
User.create(password: "2bagforall", email: "c2@b2g.com", mobile_phone: "123456789", address: "7896 Main St, Anywhere, USA", first_name: "Anna", last_name: "Ibarra", user_type: "renter")
User.create(password: "3bagforall", email: "c3@b2g.com", mobile_phone: "123456789", address: "123654 Main St, Anywhere, USA", first_name: "Jorge", last_name: "Paz", user_type: "owner")
User.create(password: "4bagforall", email: "bo1@b2g.com", mobile_phone: "123456789", address: "1278Main St, Anywhere, USA", first_name: "Laura", last_name: "Paz", user_type: "owner")
User.create(password: "5bagforall", email: "bo2@b2g.com", mobile_phone: "123456789", address: "1239 Main St, Anywhere, USA", first_name: "Lis", last_name: "Gonzalez", user_type: "renter")
p "Users created"


# Populate Bags

p "Creating bags"

SIZE = %w(small medium large carry-on x-large)

def fake_reservation(price_day)
  h = {}
  h[:b_begin] = Faker::Date.between(from: 30.days.ago, to: Date.today)
  h[:b_end] = h[:b_begin] + rand(2..5).days
  b_days = h[:b_end] - h[:b_begin]
  h[:b_real_end_date] = h[:b_end] + rand(0..3).days
  h[:book_total_price] = b_days * price_day
  h
end

50.times do # en la creación de seeds se debe quitar la validación del método, de lo contrario no deja crear historia de bookings
  bag = Bag.create(
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    sku: rand(1111..9999),
    price_day: Faker::Commerce.price(range: 10..100.0),
    user: User.all.sample,
  )
  puts "Bag with id: #{bag.name}, has been created!"

  p "Creating Features"

  # populating features

  1.times do
    feature = Feature.create(
      name: "Color",
      value: Faker::Color.color_name,
      bag_id: bag.id
    )
    puts "Feature Color - #{feature.value} for #{bag.name} has been created!"

    feature = Feature.create(
      name: "Make",
      value: Faker::Commerce.brand,
      bag_id: bag.id
    )
    puts "Feature Make - #{feature.value} for #{bag.name} has been created!"

    feature = Feature.create(
      name: "Material",
      value: Faker::Commerce.material,
      bag_id: bag.id
    )
    puts "Feature Material - #{feature.value} for #{bag.name} has been created!"

    feature = Feature.create(
      name: "Size",
      value: SIZE.sample,
      bag_id: bag.id
    )
    puts "Feature Size - #{feature.value} for #{bag.name} has been created!"
  end

  # populating bookings
  past_bookings_rand = rand(0..3)

  past_bookings_rand.times do
    frh = fake_reservation(bag.price_day)
    booking = Booking.create!(
      user: User.all.sample,
      bag_id: bag.id,
      start_date: frh[:b_begin],
      end_date: frh[:b_end],
      real_end_date: frh[:b_real_end_date],
      book_total_price: frh[:book_total_price],
      booking_desc: Faker::Lorem.paragraph,
      active: false,
      status: "completed"
    )
    puts "Booking with id: #{booking.id} withe a price #{booking.book_total_price}, has been created!"
  end
end

p "Bags Created"
