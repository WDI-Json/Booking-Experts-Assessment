class CreateAccommodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.integer :sleeping_spots
      t.decimal :cost_per_night
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
