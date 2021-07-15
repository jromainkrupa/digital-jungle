# == Schema Information
#
# Table name: team_plan_sections
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plan_id    :bigint(8)        not null
#  section_id :bigint(8)        not null
#  team_id    :bigint(8)        not null
#
# Indexes
#
#  index_team_plan_sections_on_plan_id     (plan_id)
#  index_team_plan_sections_on_section_id  (section_id)
#  index_team_plan_sections_on_team_id     (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (section_id => sections.id)
#  fk_rails_...  (team_id => teams.id)
#
class TeamPlanSection < ApplicationRecord
  belongs_to :team
  belongs_to :plan
  belongs_to :section
end
