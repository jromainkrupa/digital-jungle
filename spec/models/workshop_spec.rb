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
require 'rails_helper'

RSpec.describe Workshop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
