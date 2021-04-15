class Project < ApplicationRecord
  belongs_to :user
  has_many :pitches, dependent: :destroy
  has_many :investments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true, length: {minimum:50, maximum:150}
  validate :owner_must_be_entrepreneur

  def publishable_pitch
    self.pitches.map {|pitch| pitch if pitch.is_publishable? }.first
  end

  private 

  def owner_must_be_entrepreneur
    if self.user
      unless self.user.is_entrepreneur
        errors.add :owner_must_be_entrepreneur, 'should be an entrepreneur to create a project'
      end
    end
  end
end
