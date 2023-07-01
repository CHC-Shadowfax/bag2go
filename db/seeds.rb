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
MALETAS = [
  'https://hips.hearstapps.com/hmg-prod/images/best-luggage-1554348191.png?crop=1.00xw:1.00xh;0,0&resize=1200:*',
  'https://www.refinery29.com/images/11263071.jpg?crop=40%3A21',
  'https://s.alicdn.com/@sc04/kf/H4d2f3011653e402dae2da29719fad6b22.png',
  'https://monos.com/cdn/shop/products/Product_CheckIn_L_OliveGreen_Front_389ebd0d-7af4-4264-8845-fcf9df14d4b1_1512x.jpg?v=1678767276',
  'https://july.com/static/8474afce707697a89bfa85abe4f6d217/049b4/CHKP_Navy_1_0f788e14d9.webp',
  'https://hips.hearstapps.com/hmg-prod/images/best-luggage-1554348191.png?crop=1.00xw:1.00xh;0,0&resize=1200:*',
  'https://shop.samsonite.com/dw/image/v2/BBZB_PRD/on/demandware.static/-/Sites-product-catalog/default/dw50a2bab2/collections/_samsonite/freeform/500x500/782571041_28Spin.jpg?sw=912&sh=912',
  'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6527/6527115_sd.jpg',
  'https://shop.samsonite.com/dw/image/v2/BBZB_PRD/on/demandware.static/-/Sites-product-catalog/default/dw814596aa/collections/_samsonite/centric/500x500/1026902824be01.jpg?sw=912&sh=912',
  'https://july.com/static/d1711b6b5172dadd9e7e8de8d158b402/52a33/1_86a10a9d1a.webp'
]
50.times do # en la creación de seeds se debe quitar la validación del método, de lo contrario no deja crear historia de bookings
  file = URI.open(MALETAS.sample)
  bag = Bag.create(
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    sku: rand(1111..9999),
    price_day: Faker::Commerce.price(range: 10..100.0),
    user: User.all.sample,
  )
  bag.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

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
