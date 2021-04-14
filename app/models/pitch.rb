class Pitch < ApplicationRecord
  belongs_to :project
  has_one_attached :video

  validates :title, presence: true
  validates_inclusion_of :is_publishable, in: [true, false]
end
