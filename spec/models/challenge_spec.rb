# == Schema Information
#
# Table name: challenges
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint(8)        not null
#
# Indexes
#
#  index_challenges_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
require 'rails_helper'

describe Challenge, type: :model do
  context 'Associations' do
    it { should belong_to(:section) } 
    it { should have_many(:lectures) } 
    it { should have_many(:exercises) } 
  end

  context 'Validations' do
    it "is valid with a name and section" do
      section = create(:section)
      challenge = Challenge.create(name: "digital jungle", section: section)
      expect(challenge).to be_valid
    end

    it "is invalid without a name" do
      challenge = Challenge.new(name: nil)
      challenge.valid?
      expect(challenge.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without a section" do
      challenge = Challenge.new(section: nil)
      challenge.valid?
      expect(challenge.errors[:section]).to include('must exist')
    end
  end
end
