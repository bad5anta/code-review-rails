module Api
  module Stacks
    class IndexInteraction < ActiveInteraction::Base

      def execute
        Stack.all
      end
    end
  end
end
