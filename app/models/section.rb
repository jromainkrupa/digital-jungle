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
class Section < ApplicationRecord
end
