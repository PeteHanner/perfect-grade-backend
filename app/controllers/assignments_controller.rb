class AssignmentsController < ApplicationController
  def index
    render json: Assignment.date_grouped
  end
end
