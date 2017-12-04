module Api
  module V1
    class DiffsController < ApplicationController
      def index
        render json: Diffs::IndexInteraction.run!, include: serialize_includes
      end

      private

      def serialize_includes
        'author,reviewer,stack'
      end
    end
  end
end
