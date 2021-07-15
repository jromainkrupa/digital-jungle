# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

describe Team, type: :model do
  context 'Associations' do
    it { should belong_to(:owner) } 
    it { should have_many(:team_sections) } 
    it { should have_many(:sections).through(:team_sections) } 
    it { should have_many(:team_members) } 
    it { should have_many(:users).through(:team_members) } 
  end

  context 'Validations' do
    it "is valid with a name and an owner" do
      owner = create(:user)
      team = Team.create(name: "digital jungle", owner: owner)
      expect(team).to be_valid
    end

    it "is invalid without a name" do
      team = Team.new(name: nil)
      team.valid?
      expect(team.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without an owner" do
      team = Team.new(owner: nil)
      team.valid?
      expect(team.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without an already taken name" do
      team_1 = create(:team, name: "toto")
      team_2 = build(:team, name: "toto")
      team_2.valid?
      expect(team_2.errors[:name]).to include('has already been taken')
    end
  end
end
