# == Schema Information
#
# Table name: sections
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  price_in_cents :integer(4)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Section, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
