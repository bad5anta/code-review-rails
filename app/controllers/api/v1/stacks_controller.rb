module Api
  module V1
    class StacksController < BaseController
      def index
        render json: Stacks::IndexInteraction.run!
      end
    end
  end
end
