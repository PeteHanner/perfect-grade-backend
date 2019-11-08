class CoursesController < ApplicationController
  def index
    render json: User.find(1).courses
  end

  def create
    # puts params[:courseTitle]
    newCourse = Course.create(
      name: params[:courseTitle],
      user: User.find(params[:userId])
    )
    render json: newCourse
  end

  def destroy
    puts params
    Course.destroy(params[:id])
    render json: User.find(1).courses # # TODO: take out hardcoding once auth
  end
end
