class AssignmentsController < ApplicationController
  def index
    render json: Assignment.final_adjusted_schedule
  end
end