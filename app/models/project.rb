include ActionView::Helpers::NumberHelper

class Project < ApplicationRecord
  belongs_to :user
  has_many :pitches, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :project_messages, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true, length: {minimum:30, maximum:200}
  validate :owner_must_be_entrepreneur

  after_create :create_slack_channel

  def publishable_pitch
    self.pitches.map {|pitch| pitch if pitch.is_publishable? }.compact.first
  end

  def total_amount_invested
    # amount = self.investments.map { |investment| investment.amount }.sum
    amount = self.investments.sum(&:amount) 
    number_to_human(amount,format: '%n %u', precision: 4, units: { thousand: 'K€', million: 'M€', billion: 'B€' })
  end

  private 

  def owner_must_be_entrepreneur
    if self.user
      unless self.user.is_entrepreneur
        errors.add :owner_must_be_entrepreneur, 'should be an entrepreneur to create a project'
      end
    end
  end

  def create_slack_channel
    CreateSlackChannelJob.perform_later(self)
  end
end
