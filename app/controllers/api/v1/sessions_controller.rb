class Api::V1::SessionsController < Api::V1::BaseController
  before_action :set_user, only: %i[create]

  def create
    if @user.authenticate(params[:user][:password])
      render json: {
        id: @user.id, email: @user.email, name: @user.name, token: CodeReview::JsonWebToken.create_token(@user)
      }
    else
      render body: nil, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by!(email: params[:user][:email])
  end
end
