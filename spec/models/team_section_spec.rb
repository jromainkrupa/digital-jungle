# == Schema Information
#
# Table name: team_sections
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint(8)        not null
#  team_id    :bigint(8)        not null
#
# Indexes
#
#  index_team_sections_on_section_id  (section_id)
#  index_team_sections_on_team_id     (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#  fk_rails_...  (team_id => teams.id)
#
require 'rails_helper'

describe TeamSection, type: :model do
  context 'Associations' do
    it { should belong_to(:section) } 
    it { should belong_to(:team) } 
  end

  context 'Validations' do
    it "is valid with a team and a section" do
      team_section = TeamSection.create(section: create(:section), team: create(:team))
      expect(team_section).to be_valid
    end

    it "is invalid without a team" do
      team_section = TeamSection.new(team: nil)
      team_section.valid?
      expect(team_section.errors[:team]).to include('must exist')
    end

    it "is invalid without a section" do
      team_section = TeamSection.new(section: nil)
      team_section.valid?
      expect(team_section.errors[:section]).to include('must exist')
    end

    it "is invalid if team already has the section" do
      team = create(:team)
      section = create(:section)
      team_section = TeamSection.create(team: team, section: section)
      team_section_2 = TeamSection.new(team: team, section: section )      
      team_section_2.valid?
      expect(team_section_2.errors[:team]).to include('has already been taken') 
    end

  end
end
