class AssignmentsController < ApplicationController
  def index

    Assignment.flatten(User.find(1).assignments)

    asgs = User.find(1).assignments
    grouped = Assignment.date_grouped(asgs, :adj_date)

    puts "Serializing data"
    serialized = grouped.transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course) }
    end

    sorted = serialized.sort_by{|k,v| k }


    render json: sorted
  end
end