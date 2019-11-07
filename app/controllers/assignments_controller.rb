class AssignmentsController < ApplicationController
  def index

    Assignment.flatten(User.find(1).assignments)

    serialized = Assignment.date_grouped(User.find(1).assignments, :adj_date).transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end


    # render json: User.find(1).assignments
    # render json: Assignment.flatten(User.find(1).assignments)#.sort_by{|k,v| k }
    render json: serialized.sort_by{|k,v| k }
  end
end