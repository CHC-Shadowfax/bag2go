class AddStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :status, :string
    change_column_default :bookings, :active, from: true, to: false
  end
end
