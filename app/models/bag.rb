class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price_day, comparison: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true, numericality: { only_integer: true }
end
