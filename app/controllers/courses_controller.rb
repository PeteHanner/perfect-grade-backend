class CoursesController < ApplicationController
  def index
    # render json: Course.all
    render json: User.find(1).courses
  end
end
