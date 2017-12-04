module Api
  module Users
    class ShowInteraction < ActiveInteraction::Base

      integer :id

      def execute
        User.find id
      end

    end
  end
end
