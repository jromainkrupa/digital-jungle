# == Schema Information
#
# Table name: exercises
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :bigint(8)        not null
#
# Indexes
#
#  index_exercises_on_challenge_id  (challenge_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#
require 'rails_helper'

describe Exercise, type: :model do
  context 'Associations' do
    it { should belong_to(:challenge) } 
  end

  context 'Validations' do
    it "is valid with a name and section" do
      challenge = create(:challenge)
      exercise = Exercise.create(name: "exercise 1", challenge: challenge)
      expect(exercise).to be_valid
    end

    it "is invalid without a name" do
      exercise = Exercise.new(name: nil)
      exercise.valid?
      expect(exercise.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without a section" do
      exercise = Exercise.new(challenge: nil)
      exercise.valid?
      expect(exercise.errors[:challenge]).to include('must exist')
    end
  end
end
