class CoursesController < ApplicationController
  def index
    byebug
    render json: current_user.courses
  end

  def create
    newCourse = Course.create(
      name: params[:courseTitle],
      user: User.find(params[:userId]),
    )
    render json: newCourse
  end

  def update
    puts params
    edited_course = Course.find(params[:courseId]).update(
      name: params[:newTitle],
    )

    render json: edited_course
  end

  def destroy
    render json: Course.find(params[:id])
    Course.destroy(params[:id])
  end
end
