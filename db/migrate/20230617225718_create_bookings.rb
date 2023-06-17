class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.float :book_total_price
      t.text :booking_desc
      t.boolean :active, default: true
      t.date :real_end_date
      t.references :user, null: false, foreign_key: true
      t.references :bag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
