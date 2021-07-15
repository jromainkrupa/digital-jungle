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
class Team < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :team_members
  has_many :users, through: :team_members
  has_many :team_sections
  has_many :sections, through: :team_sections

  validates :name, presence: true, uniqueness: true
end

