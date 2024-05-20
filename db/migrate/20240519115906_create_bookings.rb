class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: true
      t.date :date_of_stay
      t.integer :amount_of_days
      t.timestamps
    end
  end
end
