class AssignmentsController < ApplicationController
  def index
    render json: Assignment.flattened
  end
end
