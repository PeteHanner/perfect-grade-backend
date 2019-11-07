class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :assignments

  def assignments

    Assignment.date_grouped(self.object.assignments, :og_date).transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end

    # self.object.assignments.map do |asg|
    #   {
    #     description: asg.description,
    #     og_date: asg.og_date,
    #     adj_date: asg.adj_date,
    #     course_id: asg.course_id
    #   }
    # end
  end
end
