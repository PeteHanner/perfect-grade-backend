class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :assignments

  def assignments

    Assignment.date_grouped(self.object.assignments, :og_date).transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end
  end
end
