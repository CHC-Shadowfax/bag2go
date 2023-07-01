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
  'https://july.com/static/d1711b6b5172dadd9e7e8de8d158b402/52a33/1_86a10a9d1a.webp',
  'https://cdn.shopify.com/s/files/1/1539/8211/products/DDH_8025_clipped_rev_1_3cb12267-714b-410c-acd8-f2d9aa07b30c.jpg?v=1655761730',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg7qDrTHVQS4gnovtuIKE5h4J-6OFNxGCucIBwXHMeeoEOQ_sF2AYEl6I8l5jaMKIit74&usqp=CAU',
  'https://m.media-amazon.com/images/I/71JQoMs+T6L._AC_SL1500_.jpg',
  'https://s7d9.scene7.com/is/image/KiplingBrand/0882256000016_KI6351_654_A.jpg?$xxlarge$&fmt=webp',
  'https://m.media-amazon.com/images/I/710xg7f6ahL._AC_UY1100_.jpg',
  'https://m.media-amazon.com/images/I/71uCg26TTiL._AC_UY1100_.jpg',
  'https://www.switchbacktravel.com/sites/default/files/image_fields/Best%20Of%20Gear%20Articles/Hiking%20and%20Backpacking/Backpacking%20Packs/Osprey%20Atmos%20AG%2065%20backpacking%20pack%20%28green%29.jpg',
  'https://www.rei.com/media/product/185568',
  'https://scoutlife.org/wp-content/uploads/2017/04/backpack-1.jpg?w=700',
  'https://img.guess.com/image/upload/f_auto,q_auto:eco,fl_strip_profile,dpr_1.5,fl_advanced_resize,fl_progressive,w_392,c_scale/v1/NA/Style/ECOMM/S7452948-TPG',
  'https://cdn.shopify.com/s/files/1/0556/2643/2670/products/3208587_1_500x.png?v=1681357718',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9GPrq7wVTnCm8vg19obDAhwL-dyrHVxOMNrSFgUPAPozTp_5A0pvwSpg-eAXIzEKQ7pU&usqp=CAU'
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
