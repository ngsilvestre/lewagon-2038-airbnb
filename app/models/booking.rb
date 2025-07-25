class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  attribute :status, :integer
  enum status: { pending: 0, confirmed: 1, denied: 2 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    if start_date.present? && end_date.present? && start_date >= end_date
      errors.add(:start_date, "must be before end date")
    end
  end
end
