class Listing < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :location, :title ],
                  using: {
                    tsearch: { prefix: true }
                  }

  def average_rating
    return 0 if reviews.empty?
    reviews.sum(:rating) / reviews.size.to_f
  end
end
