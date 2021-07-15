# == Schema Information
#
# Table name: sections
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  price_in_cents :integer(4)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Section < ApplicationRecord
  has_many :team_sections
  has_many :challenges
  has_many :lectures, through: :challenges
  has_many :exercises, through: :challenges

  validates :name, presence: true, uniqueness: true 
end
