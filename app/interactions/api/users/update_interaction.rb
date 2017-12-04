module Api
  module Users
    class UpdateInteraction < ActiveInteraction::Base

      integer :id
      string :email
      string :name
      array :stack


      def execute
        user = User.find id
        user.assign_attributes email: email,
          name: name,
          stack: stack
        user if user.save!
      end

    end
  end
end
