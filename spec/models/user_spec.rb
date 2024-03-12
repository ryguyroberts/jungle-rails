require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all fields and matching passwords' do
      user = User.new(
        name: 'TestUser',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(user.valid?).to be_truthy
    end

    it 'is not valid if passwords are supplied but do not match' do
      user = User.new(
        name: 'TestUser',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'passtest'
      )

      expect(user.valid?).to be_falsey
    end

    it 'is not valid if the email is already in the DB' do
      user = User.create(
        name: 'TestUser',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(user.valid?).to be_truthy

      # Duplicate user with same email, but case difference
      duplicate_user = User.new(
        name: 'TestUser',
        email: 'TESTUSER@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include('has already been taken')
    end
  end
end
