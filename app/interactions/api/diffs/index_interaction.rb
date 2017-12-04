module Api
  module Diffs
    class IndexInteraction < ActiveInteraction::Base

      def execute

        Diff.all

      end
    end
  end
end
