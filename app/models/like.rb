class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :is_like, presence: true

end
