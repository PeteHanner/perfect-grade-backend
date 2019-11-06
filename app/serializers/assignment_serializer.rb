class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :og_date, :adj_date, :course_id
end
