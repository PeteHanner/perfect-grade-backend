class User < ApplicationRecord
  has_many :courses
  has_many :assignments, through: :courses

  def flatten
    workload = self.assignments
    print workload
  end

end
