class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bag

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  # comentar las siguientes 2 lineas al momento de crear los seeds, la validación impide fechas en el pasado.
  validates :start_date, comparison: { greater_than: Date.today.beginning_of_day }, on: :create
  validates :real_end_date, comparison: { greater_than: Time.now }, allow_nil: true
  validates :book_total_price, presence: true, numericality: { greater_than: 0 }
  validates :booking_desc, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w[reserved confirm active cancelled completed] }
end
