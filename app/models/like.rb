class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: true
  validates :is_like, presence: true

end
