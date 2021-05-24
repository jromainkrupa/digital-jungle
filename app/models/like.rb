class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: true
  validates :project, uniqueness: { scope: :user}
  #validates :is_like, presence: true
end
