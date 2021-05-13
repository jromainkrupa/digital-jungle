class Pitch < ApplicationRecord
  belongs_to :project
  has_one_attached :video
  has_rich_text :script

  validates_inclusion_of :is_publishable, in: [true, false]
end
