module Api
  module V1
    class StacksController < ApplicationController
      def index
        render json: Stacks::IndexInteraction.run!
      end
    end
  end
end
