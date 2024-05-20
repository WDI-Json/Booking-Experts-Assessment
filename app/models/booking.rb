class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :partner

  validates :date_of_stay, presence: true
  validates :amount_of_days, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :partner, presence: true
end
