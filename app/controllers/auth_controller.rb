class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    @user = User.find_by(name: user_login_params[:name])
    # puts @user

    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token },
             status: :accepted
    else
      render json: { message: "Invalid username or password" },
             status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:name, :password, :id, :courses)
  end
end
