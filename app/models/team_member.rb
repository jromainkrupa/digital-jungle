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
class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :user, uniqueness: { scope: :team}
end
