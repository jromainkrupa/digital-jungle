# == Schema Information
#
# Table name: lectures
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :bigint(8)        not null
#
# Indexes
#
#  index_lectures_on_challenge_id  (challenge_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#
require 'rails_helper'

describe Lecture, type: :model do
  context 'Associations' do
    it { should belong_to(:challenge) } 
  end

  context 'Validations' do
    it "is valid with a name and section" do
      challenge = create(:challenge)
      lecture = Lecture.create(name: "lecture 1", challenge: challenge)
      expect(lecture).to be_valid
    end

    it "is invalid without a name" do
      lecture = Lecture.new(name: nil)
      lecture.valid?
      expect(lecture.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without a section" do
      lecture = Lecture.new(challenge: nil)
      lecture.valid?
      expect(lecture.errors[:challenge]).to include('must exist')
    end
  end
end
