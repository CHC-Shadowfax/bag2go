class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bags
  has_many :bookings

  validates :user_type, presence: true, inclusion: { in: %w[owner renter] }


  # def is_owner_of_this_(bag)
  #   bag.user == self
  # end
end

# # bag show page
# if current_user.is_owner_of_this_(bag)
# # show the bookings of the bag
# end
