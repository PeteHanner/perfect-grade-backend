class AssignmentsController < ApplicationController
  def index

    serialized = Assignment.date_grouped(Assignment.user_asgmts(1), :adj_date).transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end


    # render json: User.find(1).assignments
    render json: Assignment.no_empty_days(User.find(1).assignments)#.sort_by{|k,v| k }
    # render json: serialized
  end
end