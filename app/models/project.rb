class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validate :owner_must_be_entrepreneur

  private 

  def owner_must_be_entrepreneur
    if self.user
      unless self.user.is_entrepreneur
        errors.add :owner_must_be_entrepreneur, 'should be an entrepreneur to create a project'
      end
    end
  end
end
