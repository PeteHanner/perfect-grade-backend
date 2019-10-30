class AssignmentsController < ApplicationController
  def index
    assignments = Assignment.all
    render json: assignments
  end
end
