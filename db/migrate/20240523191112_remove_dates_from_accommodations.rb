class RemoveDatesFromAccommodations < ActiveRecord::Migration[7.1]
  def change
    remove_column :accommodations, :start_date, :date
    remove_column :accommodations, :end_date, :date
  end
end
