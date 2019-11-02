class AssignmentsController < ApplicationController
  def index
    render json: Assignment.test_output
  end
end

## NO EMPTY DAYS:

# check first day of 