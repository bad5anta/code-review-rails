module Api
  module V1
    class UsersController < BaseController
      before_action :authenticate_request!

      def index
        render json: Users::IndexInteraction.run!, include: serialize_includes
      end

      def show
        render json: Users::ShowInteraction.run!(user_params), include: serialize_includes
      end

      def update
        render json: Users::UpdateInteraction.run!(user_params), include: serialize_includes
      end

      def destroy
        render json: Users::DestroyInteraction.run!(user_params), include: serialize_includes
      end

      private

      def serialize_includes
        'stacks'
      end

      def user_params
        params.permit!
      end
    end
  end
end
