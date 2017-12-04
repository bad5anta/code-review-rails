module AuthConcern
  extend ActiveSupport::Concern

  protected

  def authenticate_request!
    raise CodeReview::Errors::UnauthorizedUserError unless user_id_present?
    @current_user = User.find(auth_token[:user][:id])
    raise CodeReview::Errors::UnauthorizedUserError unless password_correct?(@current_user)
  end

  private

  def http_token
    @http_token ||= request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    @auth_token ||= CodeReview::JsonWebToken.decode(http_token)
  end

  def user_id_present?
    http_token && auth_token && auth_token.dig(:user, :id).present?
  end

  def password_correct?(user)
    http_token && auth_token && auth_token.dig(:user, :password) == user.password_digest
  end
end
