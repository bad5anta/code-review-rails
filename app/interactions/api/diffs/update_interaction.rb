module Api
  module Diffs
    class CreateInteraction < ActiveInteraction::Base

      hash :code_changes, strip: false

      integer :id
      string :status

      def execute
        diff = Diff.find id

        diff.code_changes = code_changes if code_changes
        diff.status = status if status

        UserMailer.we(User.last).deliver

        diff if diff.save!
      end
    end
  end
end
