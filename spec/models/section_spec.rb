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

describe Section, type: :model do
  context 'Associations' do
    it { should have_many(:team_sections) } 
    it { should have_many(:challenges) } 
    it { should have_many(:lectures).through(:challenges) } 
    it { should have_many(:exercises).through(:challenges) } 
  end

  context 'Validations' do
    it "is valid with a name" do
      section = Section.create(name: "UX Desing")
      expect(section).to be_valid
    end

    it "is invalid without a name" do
      section = Section.new(name: nil)
      section.valid?
      expect(section.errors[:name]).to include('can\'t be blank')
    end
  end
end
