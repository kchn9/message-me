class User < ApplicationRecord
  has_secure_password
  has_many :messages
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
  validates :terms, acceptance: true
  validates :password_confirmation, presence: true
end
