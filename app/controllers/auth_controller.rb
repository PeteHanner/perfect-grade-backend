class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(name: user_login_params[:name])
  end
end
