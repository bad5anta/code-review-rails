module Api
  module Diffs
    class CreateInteraction < ActiveInteraction::Base

      hash :code_changes, strip: false

      integer :author_id
      integer :reviewer_id
      integer :stack_id

      def execute

        diff = Diff.new
        diff.code_changes = code_changes if code_changes

        author = User.find author_id
        diff.author = author if author

        reviewer = User.find reviewer_id
        diff.reviewer = reviewer if reviewer

        stack = Stack.find stack_id
        diff.stack = stack if stack

        diff if diff.save!
      end
    end
  end
end
