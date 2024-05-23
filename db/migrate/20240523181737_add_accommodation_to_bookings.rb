class AddAccommodationToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :accommodation, null: false, foreign_key: true
  end
end
