class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validate :investor_is_project_owner?, on: :create
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :user_balance_is_over_investment_amount?, on: :create

  after_commit :deduct_investment_amount_from_user_balance

  private

  def investor_is_project_owner?
    if self.user
      unless self.user != self.project.user
        errors.add :user, 'you can\'t invest in your own project'
      end
    end
  end

  def user_balance_is_over_investment_amount?
    if self.user
      unless self.amount <= self.user.balance
        errors.add :user, 'you don\'t have enough money'
      end
    end
  end

  def deduct_investment_amount_from_user_balance
    user.balance -= amount 
    user.save
  end
end
