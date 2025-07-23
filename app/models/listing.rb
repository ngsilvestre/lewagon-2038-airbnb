class Listing < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :location, :description ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
