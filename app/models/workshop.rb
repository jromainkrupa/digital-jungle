class Workshop < ApplicationRecord
  belongs_to :user
  has_many :workshop_bookings, dependent: :destroy
  has_many :users, through: :workshop_bookings
  has_rich_text :body
  has_rich_text :value_added
  validates :name, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
end
