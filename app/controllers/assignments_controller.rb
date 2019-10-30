class AssignmentsController < ApplicationController
  def index
    assignments = Assignment.ordered
    render json: assignments
  end
end
