class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :investments, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name}
  validates :email, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  def age_in_days
  end

  def self.language_list
    [['English', 'en'], ['Français', 'fr']]
  end
end
