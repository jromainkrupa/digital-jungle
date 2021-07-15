# == Schema Information
#
# Table name: workshops
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  capacity   :integer(4)
#  duration   :integer(4)
#  image_url  :string
#  name       :string
#  price      :integer(4)
#  slug       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_workshops_on_slug     (slug) UNIQUE
#  index_workshops_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

describe Workshop, type: :model do
  context 'Associations' do
    it { should belong_to(:user) } 
    it { should have_many(:workshop_bookings) } 
    it { should have_many(:users).through(:workshop_bookings) } 
  end

  context 'Validations' do
    it "is valid with a user, name, address..." do
      user = create(:user)
      workshop = Workshop.create(name: "workshop 1",
                                 user: user,
                                 address: "rue des capucins",
                                 image_url: "images.png",
                                 price: 12,
                                 duration: 12,
                                 start_date: Time.zone.now)
      expect(workshop).to be_valid
    end

    it "is invalid without a name" do
      workshop = Workshop.new(name: nil)
      workshop.valid?
      expect(workshop.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without a start date" do
      workshop = Workshop.new(start_date: nil)
      workshop.valid?
      expect(workshop.errors[:start_date]).to include('can\'t be blank')
    end

    it "is invalid without a duration" do
      workshop = Workshop.new(duration: nil)
      workshop.valid?
      expect(workshop.errors[:duration]).to include('can\'t be blank')
    end

    it "is invalid without a user" do
      workshop = Workshop.new(user: nil)
      workshop.valid?
      expect(workshop.errors[:user]).to include('must exist')
    end
  end
end
