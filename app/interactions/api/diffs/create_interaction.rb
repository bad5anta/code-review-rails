module Api
  module Diffs
    class CreateInteraction < ActiveInteraction::Base

      # hash :code_changes, strip: false
      string :code_changes

      integer :author_id
      integer :stack_id

      def execute

        # json = JSON.parse code_changes

        diff = Diff.new
        diff.code_changes = code_changes if code_changes

        author = User.find author_id
        diff.author = author if author

        reviewer = author.reviewer_by_stack(stack_id)
        diff.reviewer = reviewer if reviewer

        stack = Stack.find stack_id
        diff.stack = stack if stack

        diff if diff.save!
      end
    end
  end
end
