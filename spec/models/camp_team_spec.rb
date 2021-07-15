# == Schema Information
#
# Table name: camp_teams
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  camp_id    :bigint(8)        not null
#  team_id    :bigint(8)        not null
#
# Indexes
#
#  index_camp_teams_on_camp_id  (camp_id)
#  index_camp_teams_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (camp_id => camps.id)
#  fk_rails_...  (team_id => teams.id)
#
require 'rails_helper'

RSpec.describe CampTeam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
