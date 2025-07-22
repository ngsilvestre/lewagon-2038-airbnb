class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  enum status: { pending: 0, confirmed: 1, denied: 2 }
end
