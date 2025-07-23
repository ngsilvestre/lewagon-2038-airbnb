class Listing < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many_attached :photos
end
