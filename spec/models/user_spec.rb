# == Schema Information
#
# Table name: users
#
#  id                       :bigint(8)        not null, primary key
#  admin                    :boolean          default(FALSE)
#  email                    :string           default(""), not null
#  encrypted_password       :string           default(""), not null
#  first_name               :string
#  integer                  :integer(4)       default(0)
#  is_approved_for_workshop :boolean          default(FALSE)
#  is_teacher               :boolean          default(FALSE)
#  language                 :string           default("fr")
#  last_name                :string
#  next_action              :integer(4)       default("tutorial")
#  phone_number             :string
#  remember_created_at      :datetime
#  reset_password_sent_at   :datetime
#  reset_password_token     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

describe User, type: :model do
  context 'Associations' do
    it { should have_many(:workshop_bookings) } 
    it { should have_many(:team_members) } 
    it { should have_many(:teams).through(:team_members) } 
  end

  context 'Validations' do
    it "is valid with a first name, last name, email, and a balance password" do
      user = User.create(first_name: "Jean",
                        last_name: "Krupa",
                        email: "jkrupa@hotmail.fr",
                        phone_number: "0695500784",
                        password:"azerty")
      expect(user).to be_valid
    end


    it "is invalid without a first name" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('can\'t be blank')
    end

    it "is invalid without a last name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('can\'t be blank')
    end

    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include('can\'t be blank')
    end


    it "is invalid with a duplicate email address" do
      User.create(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user = User.new(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
