class AssignmentsController < ApplicationController
  def index

    serialized = Assignment.date_grouped(Assignment.user_asgmts(1), :adj_date).transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end

    render json: Assignment.avg_per_day
    # render json: serialized
  end
end