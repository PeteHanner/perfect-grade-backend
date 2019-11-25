class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: {
    case_sensitive: false,
    message: 'is already taken.'
  }

  validates :password,
  length: {
    in: 8..20,
    message: 'must be between 8 and 20 characters'
  },
  format: {
    with: /\A(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}\z/,
    message: 'must contain at least one letter, number, and special character.'
  }

  has_many :courses
  has_many :assignments, through: :courses
end
