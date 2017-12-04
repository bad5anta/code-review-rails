module Users
  class DestroyInteraction < ActiveInteraction::Base
    integer :id

    def execute
      user = User.find id
      user.destroy if user
    end

  end
end
