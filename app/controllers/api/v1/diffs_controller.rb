module Api
  module V1
    class DiffsController < ApplicationController
      def index
        respond_with_interaction Diffs::IndexInteraction
      end
    end
  end
end
