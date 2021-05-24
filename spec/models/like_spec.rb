require 'rails_helper'

describe Like, type: :model do
  context 'Associations' do
    it { should belong_to(:project) } 
    it { should belong_to(:user) } 
  end

  context 'Validations' do
    it "is valid with a project, a user" do
      user1    = create(:user)
      user2 = create(:user)
      project = create(:project, user: user2)
      like = Like.create(user: user1, project: project)
      expect(like).to be_valid
    end

    it "is invalid without a user" do
      like = Like.new(user: nil)
      like.valid?
      expect(like.errors[:user]).to include('must exist')
    end

    it "is invalid without a project" do
      like = Like.new(project: nil)
      like.valid?
      expect(like.errors[:project]).to include('must exist')
    end

    it "is invalid if already liked" do
      user1    = create(:user)
      user2 = create(:user)
      project = create(:project, user: user2)
      like = Like.create(user: user1, project: project)
      like2 = Like.create(user: user1, project: project)
      like2.valid?
      expect(like2.errors[:project]).to include('has already been taken')
    end
  end
end