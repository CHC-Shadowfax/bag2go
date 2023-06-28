class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bag

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :start_date, comparison: { greater_than: Date.today.beginning_of_day }, on: :create
  validates :book_total_price, presence: true, numericality: { greater_than: 0 }
  validates :real_end_date, comparison: { greater_than: Time.now }, allow_nil: true
  validates :booking_desc, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w[reserved confirm active cancelled completed] }
end
