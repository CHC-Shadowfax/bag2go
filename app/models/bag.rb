class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :features, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price_day, comparison: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true, numericality: { only_integer: true }

  include PgSearch::Model

  pg_search_scope :search_by_name_or_features,
    against: [:name ],
    associated_against: {
      features: [:value]
    },
    using: {
      tsearch: { prefix: true }
    }
end
