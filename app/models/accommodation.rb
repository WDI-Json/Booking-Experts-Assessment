# accommodation.rb
class Accommodation < ApplicationRecord
  belongs_to :partner
  has_many :bookings
end

# partner.rb
class Partner < ApplicationRecord
  has_many :accommodations
end

# booking.rb
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :start_date, :end_date, presence: true
end
