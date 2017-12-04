module Api
  module V1
    class DiffSerializer < ActiveModel::Serializer
      attributes :id, :code_changes

      belongs_to :author
      belongs_to :reviewer
      belongs_to :stack
    end
  end
end
