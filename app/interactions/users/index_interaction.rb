module Users
  class IndexInteraction < ActiveInteraction::Base

    def execute
      User.all
    end
  end
end
