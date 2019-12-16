class CoursesController < ApplicationController
  def index
    render json: current_user.courses
  end

  def create
    newCourse = Course.create(
      name: params[:courseTitle],
      user: current_user,
    )
    render json: newCourse
  end

  def update
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
