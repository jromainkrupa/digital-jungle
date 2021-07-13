class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :user, uniqueness: { scope: :team}
end
