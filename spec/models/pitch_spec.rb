require 'rails_helper'

describe Pitch, type: :model do
  context 'Associations' do
    it { should belong_to(:project) } 
  end

  context 'Validations' do
    it "is valid with a title, a project_id" do
      user    = create(:user)
      project = create(:project, user: user)
      pitch = Pitch.create(title: "my super pitch",
                        project: project,
                        is_publishable: false)
      expect(pitch).to be_valid
    end

    it "is invalid without a title" do
      pitch = Pitch.new(title: nil)
      pitch.valid?
      expect(pitch.errors[:title]).to include('can\'t be blank')
    end
    it "is invalid without is_publishable" do
      pitch = Pitch.new(is_publishable: nil)
      pitch.valid?
      expect(pitch.errors[:is_publishable]).to include('is not included in the list')
    end
  end
end