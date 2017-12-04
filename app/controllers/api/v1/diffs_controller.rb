module Api
  module V1
    class DiffsController < BaseController
      before_action :authenticate_request!

      def index
        render json: Diffs::IndexInteraction.run!, include: serialize_includes
      end

      def create
        render json: Diffs::CreateInteraction.run!(diff_params.merge(author_id: @current_user.id)),
               include: serialize_includes
      end

      private

      def diff_params
        params.permit!
      end

      def serialize_includes
        'author,reviewer,stack'
      end
    end
  end
end
