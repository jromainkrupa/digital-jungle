# == Schema Information
#
# Table name: workshop_bookings
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)        not null
#  workshop_id :bigint(8)        not null
#
# Indexes
#
#  index_workshop_bookings_on_user_id      (user_id)
#  index_workshop_bookings_on_workshop_id  (workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workshop_id => workshops.id)
#
class WorkshopBooking < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
  validates :user, uniqueness: { scope: :workshop}
end
