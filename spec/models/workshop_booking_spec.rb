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
require 'rails_helper'

describe WorkshopBooking, type: :model do
  context 'Associations' do
    it { should belong_to(:user) } 
    it { should belong_to(:workshop) } 
  end

  context 'Validations' do
    it "is valid with a user and workshop_booking" do
      user = create(:user)
      workshop = create(:workshop)
      workshop_booking = WorkshopBooking.create( workshop: workshop, user: user)
      expect(workshop_booking).to be_valid
    end

    it "is invalid without a user" do
      workshop_booking = WorkshopBooking.new(user: nil)
      workshop_booking.valid?
      expect(workshop_booking.errors[:user]).to include('must exist')
    end

    it "is invalid without a workshop" do
      workshop_booking = WorkshopBooking.new(workshop: nil)
      workshop_booking.valid?
      expect(workshop_booking.errors[:workshop]).to include('must exist')
    end

    it "is invalid without a duplicate workshop" do
      workshop = create(:workshop)
      user = create(:user)
      workshop_booking = WorkshopBooking.create(user: user, workshop: workshop)
      workshop_booking_2 = WorkshopBooking.new(user: user, workshop: workshop)
      workshop_booking_2.valid?
      expect(workshop_booking_2.errors[:user]).to include('has already been taken')
    end
  end
end

