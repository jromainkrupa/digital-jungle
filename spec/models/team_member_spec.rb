# == Schema Information
#
# Table name: team_members
#
#  id         :bigint(8)        not null, primary key
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint(8)        not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_team_members_on_team_id  (team_id)
#  index_team_members_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

describe TeamMember, type: :model do
  context 'Associations' do
    it { should belong_to(:user) } 
    it { should belong_to(:team) } 
  end

  context 'Validations' do
    it "is valid with a user, a team, a role" do
      team = Team.create(name: "digital jungle")
      user_1 = create(:user)
      user_2 = create(:user)
      team_user_1 = TeamMember.new(user: user_1, team: team, role: "admin")
      team_user_2 = TeamMember.new(user: user_2, team: team, role: "edit")
      expect(team_user_1).to be_valid
      expect(team_user_2).to be_valid
    end

    it "is valid without an admin status" do
      user_1 = create(:user)
      team = Team.create(name: "digital jungle", owner: user_1)
      team_user_1 = TeamMember.new(user: user_1, team: team)
      expect(team_user_1).to be_valid
    end

    it "is invalid without a team" do
      user_team = TeamMember.new(team: nil)
      user_team.valid?
      expect(user_team.errors[:team]).to include('must exist')
    end

    it "is invalid without a user" do
      user_team = TeamMember.new(user: nil)
      user_team.valid?
      expect(user_team.errors[:user]).to include('must exist')
    end

    it "is invalid when a user is added twice in the same team" do
      user_1 = create(:user)
      team = Team.create(name: "digital jungle", owner: user_1)
      user_2 = create(:user)
      team_user_1 = TeamMember.create(user: user_1, team: team, role: "admin")
      team_user_2 = TeamMember.create(user: user_2, team: team, role:"member")
      team_user_2 = TeamMember.new(user: user_2, team: team, role:"member")
      team_user_2.valid?
      expect(team_user_2.errors[:user]).to include('has already been taken')
    end
  end
end
