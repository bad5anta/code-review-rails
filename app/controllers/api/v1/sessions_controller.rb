class Api::V1::SessionsController < BaseController
  before_action :set_user, only: %i[create]

  def create
    if @user.authenticate(user_params[:password])
      render json: { id: @user.id, email: @user.email, name: @user.name, token: @user.token }, status: :created
    else
      render body: nil, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by!(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
