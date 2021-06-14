class WorkshopBooking < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
  validates :user, uniqueness: { scope: :workshop}
end
