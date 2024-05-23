class Partner < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :accommodations
  accepts_nested_attributes_for :accommodations, allow_destroy: true
  validates :name, presence: true
end
