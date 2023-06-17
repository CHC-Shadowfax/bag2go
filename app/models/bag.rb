class Bag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price_day, greater_than: 0
  validates :sku, presence: true, uniqueness: true, numericality: { only_integer: true }
end
