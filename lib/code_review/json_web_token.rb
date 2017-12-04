require 'jwt'

module CodeReview
  class JsonWebToken
    module ClassMethods
      def encode(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end

      def decode(token)
        return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
      rescue StandardError
        nil
      end

      def create_token(user)
        encode(user: { id: user.id, password: user.password_digest })
      end
    end

    extend ClassMethods
  end
end
