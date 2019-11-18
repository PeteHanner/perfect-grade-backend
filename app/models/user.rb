class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }

  validates :password,
  length: { in: 8..20, wrong_length: 'Passwords must be between 8 and 20 characters' },
  format: {with: /\A(?=.*[a-z])[a-z\d]+\Z/i}

  has_many :courses
  has_many :assignments, through: :courses

  def flatten
    workload = self.assignments
    print workload
  end

end
