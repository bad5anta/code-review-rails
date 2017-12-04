module UserAuthConcern
  extend ActiveSupport::Concern

  def token
    CodeReview::JsonWebToken.create_token(self)
  end
end
