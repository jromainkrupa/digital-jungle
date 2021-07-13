class Team < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :team_members
  has_many :users, through: :team_members
  has_many :camp_teams
  has_many :camps, through: :camp_teams

  validates :name, presence: true, uniqueness: true
end
