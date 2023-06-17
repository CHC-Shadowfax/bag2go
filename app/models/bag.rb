class Bag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :start_date, comparison: { greater_than: :end_date }
  validates :price_day, greater_than: 0
  validates :sku, presence: true, uniqueness: true, numericality: { only_integer: true }
end
