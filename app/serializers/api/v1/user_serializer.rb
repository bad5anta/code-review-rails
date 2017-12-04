module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :name, :stack, :role, :label, :reviewer_ids, :reviewee_ids, :subscriber_ids

      has_many :stacks, include: true
    end
  end
end
