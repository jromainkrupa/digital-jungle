# == Schema Information
#
# Table name: workshops
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  capacity   :integer(4)
#  duration   :integer(4)
#  image_url  :string
#  name       :string
#  price      :integer(4)
#  slug       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_workshops_on_slug     (slug) UNIQUE
#  index_workshops_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Workshop < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :workshop_bookings, dependent: :destroy
  has_many :users, through: :workshop_bookings
  has_rich_text :body
  has_rich_text :value_added
  validates :name, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
end
