class ProjectMessage < ApplicationRecord
  belongs_to :project
  validates :body, presence: true
  validates :username, presence: true
end
