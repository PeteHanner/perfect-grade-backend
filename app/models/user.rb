class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }

  validates :password,
  length: {
    in: 8..20,
    wrong_length: 'Passwords must be between 8 and 20 characters'
  },
  format: {
    with: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
    message: 'Passwords must contain at least one letter, number, and special character.'
  }

  has_many :courses
  has_many :assignments, through: :courses

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {user: UserSerializer.new(@user)}, status: :created
    else
      render json {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
