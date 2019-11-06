class AssignmentsController < ApplicationController
  def index
    render json: Assignment.user_asgmts(1)
  end
end