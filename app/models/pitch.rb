class Pitch < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates_inclusion_of :is_publishable, in: [true, false]
end
