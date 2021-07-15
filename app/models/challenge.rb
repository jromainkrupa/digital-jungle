# == Schema Information
#
# Table name: challenges
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint(8)        not null
#
# Indexes
#
#  index_challenges_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
class Challenge < ApplicationRecord
  belongs_to :section
  has_many :lectures
  has_many :exercises

  validates :name, presence: true, uniqueness: true
end
