class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :investments, dependent: :destroy

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name}
  validates :email, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :send_welcome_email

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  def self.language_list
    [['🇬🇧 English', 'en'], ['🇫🇷 Français', 'fr']]
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
