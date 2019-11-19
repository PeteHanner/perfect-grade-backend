class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {user: UserSerializer.new(@user)}, status: :created
    else
      render json: {error: @user.errors.full_messages}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
