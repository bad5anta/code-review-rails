module Api
  module V1
    class StacksController < ApplicationController
      def index
        respond_with_interaction Stacks::IndexInteraction
      end
    end
  end
end
