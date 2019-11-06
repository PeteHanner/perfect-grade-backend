class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :assignments

  def assignments

    self.object.assignments.map do |asg|
      {
        description: asg.description,
        og_date: asg.og_date,
        adj_date: asg.adj_date,
        course_id: asg.course_id
      }
    end
  end
end
