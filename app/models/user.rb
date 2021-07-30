class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
  validates :password, length: { minimum: 8. maximum: 32},
                       format: {with: /\A[0-9a-zA-Z]+\z/i }

  has_secure_password

end
