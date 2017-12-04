module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :name, :stack, :role, :label

      has_many :stacks, include: true
    end
  end
end
