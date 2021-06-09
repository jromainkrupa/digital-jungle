class Workshop < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  validates :name, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true

end
