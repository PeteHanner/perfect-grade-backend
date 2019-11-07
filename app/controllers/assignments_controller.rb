class AssignmentsController < ApplicationController
  def index

    Assignment.flatten(User.find(1).assignments)

    # puts "Finding assignments"
    asgs = User.find(1).assignments
    # puts "Found assignments"
    # puts "Grouping by date"
    grouped = Assignment.date_grouped(asgs, :adj_date)
    # puts "Grouped by date"
    # serialized = Assignment.date_grouped(User.find(1).assignments, :adj_date)

    puts "Serializing data"
    serialized = grouped.transform_values do |asg_arr|
      asg_arr.map { |asg| asg.slice(:id, :description, :og_date, :adj_date, :course_id) }
    end
    # puts "Data serialized"

    # puts "Sorting for JSON delivery"
    sorted = serialized.sort_by{|k,v| k }
    # puts "Done sorting, delivering JSON"


    # render json: User.find(1).assignments
    # render json: Assignment.flatten(User.find(1).assignments)#.sort_by{|k,v| k }
    render json: sorted
  end
end