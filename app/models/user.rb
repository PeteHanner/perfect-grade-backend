class User < ApplicationRecord
  has_many :courses
  has_many :assignments, through: :courses
end
