class AssignmentsController < ApplicationController
  def index
    # Assignment.flatten(User.find(1).assignments)
    #
    # asgs = User.find(1).assignments
    # grouped = Assignment.date_grouped(asgs, :adj_date)
    #
    # serialized = grouped.transform_values do |asg_arr|
    #   asg_arr.map do |asg|
    #     # asg.slice(:id, :description, :og_date, :adj_date)
    #     asg_obj = asg.slice(:id, :description, :og_date, :adj_date)
    #     course_data = asg.course.slice(:id, :name)
    #     asg_obj[:course] = course_data
    #     asg_obj
    #   end
    # end
    #
    # sorted = serialized.sort_by{|k,v| k }

    render json: Assignment.no_empty_days(User.find(1).assignments).sort
  end

  def first_request
    Assignment.flatten(User.find(1).assignments)

    asgs = User.find(1).assignments
    grouped = Assignment.date_grouped(asgs, :adj_date)

    serialized = grouped.transform_values do |asg_arr|
      asg_arr.map do |asg|
        # asg.slice(:id, :description, :og_date, :adj_date)
        asg_obj = asg.slice(:id, :description, :og_date, :adj_date)
        course_data = asg.course.slice(:id, :name)
        asg_obj[:course] = course_data
        asg_obj
      end
    end

    sorted = serialized.sort_by{|k,v| k }

    render json: sorted
    puts "Delivered first request"
  end

  def fresh_request
    Assignment.flatten(User.find(1).assignments)

    asgs = User.find(1).assignments
    grouped = Assignment.date_grouped(asgs, :adj_date)

    serialized = grouped.transform_values do |asg_arr|
      asg_arr.map do |asg|
        # asg.slice(:id, :description, :og_date, :adj_date)
        asg_obj = asg.slice(:id, :description, :og_date, :adj_date)
        course_data = asg.course.slice(:id, :name)
        asg_obj[:course] = course_data
        asg_obj
      end
    end

    sorted = serialized.sort_by{|k,v| k }

    render json: sorted
    puts 'Delivered fresh request'
  end

  def create
    newAsgmt = Assignment.create(
      description: params[:description],
      og_date: params[:dueDate],
      adj_date: params[:dueDate],
      course: Course.find(params[:courseId]),
    )

    render json: newAsgmt
  end

  def update
    edited_asgmt = Assignment.find(params[:id]).update(
      description: params[:newDesc],
      og_date: params[:newDate],
      adj_date: params[:newDate]
    )

    render json: edited_asgmt
  end

  def destroy
    render json: Assignment.find(params[:id])
    Assignment.destroy(params[:id])
  end


end