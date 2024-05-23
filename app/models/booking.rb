class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  belongs_to :accommodation
  has_one :invoice

  validates :date_of_stay, presence: true
  validates :amount_of_days, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :partner, presence: true
end
