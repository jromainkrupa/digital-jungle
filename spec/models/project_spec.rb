require 'rails_helper'

describe Project, type: :model do
  context 'Associations' do
    it { should belong_to(:user) } 
  end

  context 'Validations' do
    it "is valid with a name, a description, a project as entrepreneur" do
      user = create(:user)

      project = Project.create(name: "yoopitch",
                        description: "an app to pitch and receive feedbacks about what your are building",
                        user: user)
      expect(project).to be_valid
    end

    it "is invalid without a name" do
      project = Project.new(name: nil)
      project.valid?
      expect(project.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without a description" do
      project = Project.new(description: nil)
      project.valid?
      expect(project.errors[:description]).to include('can\'t be blank')
    end

    it "is invalid with a duplicate name" do
      user = FactoryBot.create(:user)

      Project.create(name: "yoopitch",
                    description: "an app to pitch and receive feedbacks about what your are building",
                    user:user)
      project = Project.new(name: "yoopitch",
                    description: "an app to pitch and receive feedbacks about what your are building",
                    user:user)
      project.valid?
      expect(project.errors[:name]).to include('has already been taken')
    end

    it "is invalid with a non entrepreneur user" do 
    user = create(:user)
    user.is_entrepreneur = false
    project = Project.create(name: "yoopitch",
    description: "an app to pitch and receive feedbacks about what your are building",
    user:user)

    p project.errors[:owner_must_be_entrepreneur]
    expect(project.errors[:owner_must_be_entrepreneur]).to include('should be an entrepreneur to create a project')  
    end
  end
end