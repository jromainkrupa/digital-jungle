require 'rails_helper'

describe Investment, type: :model do
  context 'Associations' do
    it { should belong_to(:project) } 
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it "is valid with a user, a project and an amount" do
      project     = create(:project)
      contributor = User.create(first_name: "Mathieu",
                          last_name: "cartiller",
                          email: "matt@hotmail.fr",
                          password:"azerty",
                          balance: 100001,
                          is_entrepreneur: false)

      investment  = Investment.create(amount: 100000,
                          project: project,
                          user: contributor)

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
      project = create(:project)
      investment  = Investment.create(amount: 90000,
                                      project: project,
                                      user: project.user)
      expect(investment.errors[:user]).to include('you can\'t invest in your own project')
    end

    it "it should deduct the amount from user balance" do
      project     = create(:project)
      contributor = User.create(first_name: "Mathieu",
                          last_name: "cartiller",
                          email: "matt@hotmail.fr",
                          password:"azerty",
                          balance: 100000,
                          is_entrepreneur: false)
      investment  = Investment.create(amount: 90000,
                          project: project,
                          user: contributor)

      expect(contributor.balance).to eq(10000)
    end

    it "it is invalid when user balance < amount " do
      project     = create(:project)
      contributor = User.create(first_name: "Mathieu",
                            last_name: "cartiller",
                            email: "matt@hotmail.fr",
                            password:"azerty",
                            balance: 89000,
                            is_entrepreneur: false)
      investment  = Investment.create(amount: 90000,
                            project: project,
                            user: contributor)

      expect(investment.errors[:user]).to include('you don\'t have enough money')
    end

    it "is invalid to invest twice in the same project if you don't have invested in 2 other project" do 
      pending
    end
  end
end