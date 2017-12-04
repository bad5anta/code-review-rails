module Api
  module V1
    class StackSerializer < ActiveModel::Serializer
      attributes :id, :name, :icon
    end
  end
end
