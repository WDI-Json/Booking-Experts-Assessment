# accommodation.rb
class Accommodation < ApplicationRecord
  belongs_to :partner

  validates :name, presence: true
  validates :sleeping_spots, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cost_per_night, presence: true, numericality: { greater_than_or_equal_to: 0 }
end