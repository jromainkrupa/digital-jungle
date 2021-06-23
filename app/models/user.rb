class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workshop_bookings, dependent: :destroy
  has_many :projects, dependent: :destroy
  # has_many :likes, dependent: :destroy

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name}
  validates :email, presence: true, uniqueness: true

  # after_create :send_welcome_email

  enum next_action: {
    tutorial: 0,
    create_project: 1,
    connect_slack: 2,
    learn_how_to_pitch: 3,
    create_pitch_script: 4,
    upload_pitch: 5,
    wait_validation: 6,
    validated: 7
  }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  def self.teachers
    self.where(is_teacher: true)
  end

  def self.language_list
    [['🇬🇧 English', 'en'], ['🇫🇷 Français', 'fr']]
  end

  # def self.stringify_next_action(next_action)
  #   case next_action
  #   when "tutorial" then "Watch the tutorial"
  #   when "create_project" then "Create your first project"
  #   when "connect_slack" then "Connect to Slack to discuss about your project"
  #   when "learn_how_to_pitch" then "Learn the art of a good pitch"
  #   when "create_pitch_script" then "Create the script for your pitch"
  #   when "upload_pitch" then "Record & Upload your pitch"
  #   when "wait_validation" then "Ask & Wait for content validation"
  #   when "validated" then "Start getting feedback!"     
  #   end
  # end

  # def self.linkify_next_action(next_action)
  #   case next_action
  #   when "tutorial" then :entrepreneur_tutorial
  #   end
  # end

  # def likes?(project)
  #   project.likes.where(user_id: id).any?
  # end

  # def liked_projects
  #   likes.map { |like| like.project }
  # end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end

end
