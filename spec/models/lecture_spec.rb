# == Schema Information
#
# Table name: lectures
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :bigint(8)        not null
#
# Indexes
#
#  index_lectures_on_challenge_id  (challenge_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#
require 'rails_helper'

RSpec.describe Lecture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
