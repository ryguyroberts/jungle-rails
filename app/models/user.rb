class User < ApplicationRecord
  # compares the two P/W
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
end
