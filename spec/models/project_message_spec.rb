require 'rails_helper'

describe ProjectMessage, type: :model do
  context 'Associations' do
    it { should belong_to(:project) }  
  end

  context 'Validations' do
    it "is valid with a project, a body and a username" do
      project = create(:project)
      project_message = ProjectMessage.create(project: project, body: "voici le message de toto", username: "toto")
      expect(project_message).to be_valid
    end

    it "is invalid without a project" do
      project_message = ProjectMessage.new(project: nil)
      project_message.valid?
      expect(project_message.errors[:project]).to include('must exist')
    end

    it "is invalid without a username" do
      project_message = ProjectMessage.new(username: nil)
      project_message.valid?
      expect(project_message.errors[:username]).to include('can\'t be blank')
    end

    it "is invalid without a body" do
      project_message = ProjectMessage.new(body: nil)
      project_message.valid?
      expect(project_message.errors[:body]).to include('can\'t be blank')
    end
  end
end