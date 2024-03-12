require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all fields and matching passwords' do
      user = User.new(
        first_name: 'Test',
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(user.valid?).to be_truthy
    end

    it 'is not valid if passwords are supplied but do not match' do
      user = User.new(
        first_name: 'Test',
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'passtest'
      )

      expect(user.valid?).to be_falsey
    end

    it 'is not valid if the email is already in the DB' do
      user = User.create(
        first_name: 'Test',
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(user.valid?).to be_truthy

      # Duplicate user with same email, but case difference
      duplicate_user = User.new(
        first_name: 'Test',
        last_name: 'User',
        email: 'TESTUSER@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include('has already been taken')
    end

    it 'is not valid if no first name was supplied' do
      user = User.new(
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      #false path
      expect(user.valid?).to be_falsey
      expect(user.errors[:first_name]).to include("can't be blank")

      #input the name now
      user.first_name = 'Test'
      expect(user.valid?).to be_truthy
    end

    it 'is not valid if no last name was supplied' do
      user = User.new(
        first_name: 'Test',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      #false path
      expect(user.valid?).to be_falsey
      expect(user.errors[:last_name]).to include("can't be blank")

      #input the name now
      user.last_name = 'User'
      expect(user.valid?).to be_truthy
    end

    it 'is not valid if no email was supplied' do
      user = User.new(
        first_name: 'Test',
        last_name: 'User',
        password: 'testpass',
        password_confirmation: 'testpass'
      )

      #false path
      expect(user.valid?).to be_falsey
      expect(user.errors[:email]).to include("can't be blank")

      #input the name now
      user.email = 'testuser@gmail.com'
      expect(user.valid?).to be_truthy
    end

    it 'is not valid if password is less than 8 chars.' do

      # pass to short
      user = User.new(
        first_name: 'Test',
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'short',
        password_confirmation: 'short'
      )

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")

      # make pass longer
      user.password = 'testpass'
      user.password_confirmation = 'testpass'

      expect(user.valid?).to be_truthy

    end
  end

  describe '.authenticate_with_credentials' do
    # Making a valid user to be used in every test
    before do
      @user = User.create(
        first_name: 'Test',
        last_name: 'User',
        email: 'testuser@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      )
    end

    it 'returns the user when both email and password are correct' do
      authenticated_user = User.authenticate_with_credentials('testuser@gmail.com', 'testpass')
      expect(authenticated_user).to eq(@user)
    end

    it 'returns nil when email is not found' do
    end

    it 'returns nil when email is found but pass is wrong' do

    end

    it 'returns the user even if spaces in email for a valid user' do

    end

    it 'returns the user even if the case of the email is different' do
      
    end
  end
end
