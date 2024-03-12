class User < ApplicationRecord
  # compares the two P/W
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    # Find the user by email
    user = User.find_by(email: email.strip.downcase)

    # If the user exists and the password is correct, return the user
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
