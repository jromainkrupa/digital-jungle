class WorkshopBooking < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
end
