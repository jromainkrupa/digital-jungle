require 'rails_helper'

describe Investment, type: :model do
  context 'Associations' do
    it { should belong_to(:project) } 
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it "is valid with a user, a project and an amount" do
      user    = create(:user)
      project = create(:project, user: user)
      investment = Investment.create(amount: 100000,
                        project: project,
                        user: user)
      expect(investment).to be_valid
    end

    it "is invalid without an amount" do
      investment = Investment.new(amount: nil)
      investment.valid?
      expect(investment.errors[:amount]).to include('can\'t be blank')
    end

    it "is invalid without a user" do
      investment = Investment.new(user: nil)
      investment.valid?
      expect(investment.errors[:user]).to include('must exist')
    end

    it "is invalid without a project" do
      investment = Investment.new(project: nil)
      investment.valid?
      expect(investment.errors[:project]).to include('must exist')
    end

    it "is invalid without a negative amount" do
      investment = Investment.new(amount: -1000)
      p investment.valid?
      expect(investment.errors[:amount]).to include('must be greater than 0')
    end

    it "is invalid without an amount of 0" do
      investment = Investment.new(amount: 0)
      p investment.valid?
      expect(investment.errors[:amount]).to include('must be greater than 0')
    end

    it "it is invalid when you invest on your own project" do
      pending
    end

    it "it should deduct the amount from user balance" do
      pending
    end

    it "it is invalid when user balance < amount " do
      pending
    end
    
  end
end