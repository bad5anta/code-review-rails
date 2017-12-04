module RescueFromConcern
  extend ActiveSupport::Concern

  AUTHORIZATION_EXCEPTIONS = [JWT::VerificationError, JWT::DecodeError,
                              CodeReview::Errors::UnauthorizedUserError].freeze
  PAGE_NOT_FOUND_EXCEPTIONS = [ActionController::UnknownController,
                               ActionController::MethodNotAllowed,
                               AbstractController::ActionNotFound,
                               ActiveRecord::RecordNotFound,
                               ActionController::RoutingError,
                               ActionController::InvalidAuthenticityToken,
                               ActionController::UnknownHttpMethod,
                               ActionController::UnknownFormat].freeze

  included do
    unless Rails.env.development? || Rails.env.test?
      rescue_from Exception do |exception|
        Rails.logger.error exception.inspect
        render_500
      end

      rescue_from *PAGE_NOT_FOUND_EXCEPTIONS do |exception|
        Rails.logger.error exception.inspect
        render_404
      end

      rescue_from *AUTHORIZATION_EXCEPTIONS do
        render json: { error: 'User is not authorized' }, status: :unauthorized
      end
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.all { render body: nil, status: :not_found }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500", layout: false, status: :internal_server_error }
      format.all { render body: nil, status: :internal_server_error }
    end
  end
end
