class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :courses
  has_many :courses
end
