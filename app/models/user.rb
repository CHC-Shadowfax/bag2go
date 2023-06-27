class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bags
  has_many :bookings

  # Son logs bookings que ha recibido los bags del usuario
  has_many :bookings_as_owner, through: :bags, source: :bookings

  # Son los bags que ha reservado el usuario
  has_many :bags_as_customer, through: :bookings, source: :bag

  validates :user_type, presence: true, inclusion: { in: %w[owner renter] }


  # def is_owner_of_this_(bag)
  #   bag.user == self
  # end
end

# # bag show page
# if current_user.is_owner_of_this_(bag)
# # show the bookings of the bag
# end
